<?php

namespace traits\model;

use think\db\Query;
use think\Model;

/**
 * @mixin \Think\Model
 */
trait SoftDelete
{
    /**
     * 判断当前实例是否被软Delete
     * @access public
     * @return boolean
     */
    public function trashed()
    {
        $field = $this->getDeleteTimeField();

        if ($field && !empty($this->data[$field])) {
            return true;
        }
        return false;
    }

    /**
     * 查询包含软Delete的数据
     * @access public
     * @return Query
     */
    public static function withTrashed()
    {
        return (new static )->getQuery();
    }

    /**
     * 只查询软Delete数据
     * @access public
     * @return Query
     */
    public static function onlyTrashed()
    {
        $model = new static();
        $field = $model->getDeleteTimeField(true);

        if ($field) {
            return $model->getQuery()->useSoftDelete($field, ['not null', '']);
        } else {
            return $model->getQuery();
        }
    }

    /**
     * Delete当前的记录
     * @access public
     * @param bool $force 是否强制Delete
     * @return integer
     */
    public function delete($force = false)
    {
        if (false === $this->trigger('before_delete', $this)) {
            return false;
        }

        $name = $this->getDeleteTimeField();
        if ($name && !$force) {
            // 软Delete
            $this->data[$name] = $this->autoWriteTimestamp($name);
            $result            = $this->isUpdate()->save();
        } else {
            // 强制Delete当前模型数据
            $result = $this->getQuery()->where($this->getWhere())->delete();
        }

        // 关联Delete
        if (!empty($this->relationWrite)) {
            foreach ($this->relationWrite as $key => $name) {
                $name   = is_numeric($key) ? $name : $key;
                $result = $this->getRelation($name);
                if ($result instanceof Model) {
                    $result->delete();
                } elseif ($result instanceof Collection || is_array($result)) {
                    foreach ($result as $model) {
                        $model->delete();
                    }
                }
            }
        }

        $this->trigger('after_delete', $this);

        // 清空原始数据
        $this->origin = [];

        return $result;
    }

    /**
     * Delete记录
     * @access public
     * @param mixed $data  主键列表(支持闭包查询条件)
     * @param bool  $force 是否强制Delete
     * @return integer 成功Delete的记录数
     */
    public static function destroy($data, $force = false)
    {
        if (is_null($data)) {
            return 0;
        }

        // 包含软Delete数据
        $query = self::withTrashed();
        if (is_array($data) && key($data) !== 0) {
            $query->where($data);
            $data = null;
        } elseif ($data instanceof \Closure) {
            call_user_func_array($data, [ & $query]);
            $data = null;
        }

        $count = 0;
        if ($resultSet = $query->select($data)) {
            foreach ($resultSet as $data) {
                $result = $data->delete($force);
                $count += $result;
            }
        }

        return $count;
    }

    /**
     * 恢复被软Delete的记录
     * @access public
     * @param array $where 更新条件
     * @return integer
     */
    public function restore($where = [])
    {
        if (empty($where)) {
            $pk         = $this->getPk();
            $where[$pk] = $this->getData($pk);
        }

        $name = $this->getDeleteTimeField();

        if ($name) {
            // 恢复Delete
            return $this->getQuery()
                ->useSoftDelete($name, ['not null', ''])
                ->where($where)
                ->update([$name => null]);
        } else {
            return 0;
        }
    }

    /**
     * 查询默认不包含软Delete数据
     * @access protected
     * @param Query $query 查询对象
     * @return Query
     */
    protected function base($query)
    {
        $field = $this->getDeleteTimeField(true);
        return $field ? $query->useSoftDelete($field) : $query;
    }

    /**
     * 获取软Delete字段
     * @access public
     * @param bool $read 是否查询操作(写操作的时候会自动去掉表别名)
     * @return string
     */
    protected function getDeleteTimeField($read = false)
    {
        $field = property_exists($this, 'deleteTime') && isset($this->deleteTime) ?
        $this->deleteTime :
        'delete_time';

        if (false === $field) {
            return false;
        }

        if (!strpos($field, '.')) {
            $field = '__TABLE__.' . $field;
        }

        if (!$read && strpos($field, '.')) {
            $array = explode('.', $field);
            $field = array_pop($array);
        }

        return $field;
    }
}
