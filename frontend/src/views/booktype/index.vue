<template>
  <div class="app-container">
    <!-- 顶部功能 -->
    <div class="filter-container" style="margin-bottom: 15px">
      <!-- 类型名输入 -->
      <el-input v-model="queryParam.booktypename" placeholder="ClassName" style="width: 200px;" class="filter-item" @keyup.enter.native="handleFilter" />
      <!-- 一些按钮 -->
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        Search
      </el-button>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" @click="handleShowAll">
        Show all
      </el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit" @click="handleCreate">
        Add Class
      </el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="danger" icon="el-icon-delete" @click="handleDeleteSome">
        Betch delete
      </el-button>
    </div>

    <!--弹出框-->
    <el-dialog :title="formTitle" :visible.sync="dialogFormVisible" width="30%">
      <!--普通表单-->
      <el-form :model="form" :rules="rules" ref="ruleForm" label-width="80px">

        <el-form-item label="ClassName" prop="booktypename">
          <el-input v-model="form.booktypename"></el-input>
        </el-form-item>

        <el-form-item label="ClassDescription" prop="booktypedesc">
          <el-input type="textarea" v-model="form.booktypedesc"></el-input>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="submitForm">Confirm</el-button>
      </div>
    </el-dialog>

    <!--数据表格-->
    <el-table
        ref="multipleTable"
        :data="tableData"
        border
        style="width: 100%">
      <el-table-column
          fixed
          type="selection"
          width="55">
      </el-table-column>
      <el-table-column
          fixed
          prop="booktypeid"
          label="ClassID"
          width="100">
      </el-table-column>
      <el-table-column
          prop="booktypename"
          label="ClassName"
          show-overflow-tooltip>
      </el-table-column>
      <el-table-column
          prop="booktypedesc"
          label="ClassDescription"
          show-overflow-tooltip>
      </el-table-column>
      <el-table-column
          fixed="right"
          label="Handle"
          width="150">
        <template slot-scope="scope">
          <el-button @click="handleUpdate(scope.row)" type="primary" size="small">Edit</el-button>
          <el-button @click="handleDelete(scope.row,scope.$index)" type="danger" size="small">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--分页条-->
    <el-pagination
        background
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page.sync="queryParam.page"
        :page-sizes="[5, 10, 20, 50]"
        :page-size="queryParam.limit"
        layout="total, sizes, prev, pager, next, jumper"
        :total="recordTotal"
        style="margin-top: 15px">
    </el-pagination>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import waves from '@/directive/waves' // waves directive
import { getCount,queryBookTypes,queryBookTypesByPage,addBookType,deleteBookType,deleteBookTypes,updateBookType }
from '@/api/booktype'

export default {
  name: 'Bookinfo',
  directives: { waves },
  // 创建后
  created() {
    // 从服务器获取数据表格第一页的信息
    queryBookTypesByPage(this.queryParam).then(res => {
      console.log('Get index`s data successfully', res)
      this.tableData = res.data
      this.recordTotal = res.count
    })
  },
  methods: {
    // 分页大小改变监听
    handleSizeChange(curSize) {
      const params = this.queryParam
      params.limit = curSize
      queryBookTypesByPage(params).then(res => {
            console.log('Get page`s data successfully', res)
            this.tableData = res.data
            this.recordTotal = res.count
      })
    },

    // 点击分页监听方法
    handleCurrentChange(curPage) {
      const params = this.queryParam
      params.page = curPage
      queryBookTypesByPage(params).then(res => {
            console.log('Get page`s data successfully', res)
            this.tableData = res.data
            this.recordTotal = res.count
      })
    },

    // 搜索
    handleFilter() {
      this.queryParam.page = 1
      queryBookTypesByPage(this.queryParam).then(res => {
        if(res.code === 0) {
          this.tableData = res.data
          this.recordTotal = res.count
        }
      })
    },

    // 显示全部
    handleShowAll() {
      this.queryParam.page = 1
      this.queryParam.booktypename = null
      queryBookTypesByPage(this.queryParam).then(res => {
        if(res.code === 0) {
          this.tableData = res.data
          this.recordTotal = res.count
        }
      })
    },

    // 点击添加记录
    handleCreate() {
      // 表单是添加状态
      this.formType = 0
      // 将空数据置入form
      this.form = {
        booktypeid: null,
        booktypename: 'Nature Novels',
        booktypedesc: 'This is a type of book that contains nature novels.'
      }
      // 显示表单框
      this.dialogFormVisible = true
    },

    // 点击编辑记录
    handleUpdate(row) {
      // 表单是编辑状态
      this.formType = 1
      // 将行数据置入form
      this.form = {
        booktypeid: row.booktypeid,
        booktypename: row.booktypename,
        booktypedesc: row.booktypedesc
      }
      // 显示表单框
      this.dialogFormVisible = true
    },

    // 添加和更新的提交表单
    submitForm() {
      if (this.formType === 0) {  // 添加记录
        addBookType(this.form).then(res => {
          if(res === 1) {
            this.$message.success('Add record successfully')
            // 跳转到末尾
            getCount().then(res => {
              this.recordTotal = res
              this.queryParam.page = Math.ceil(this.recordTotal / this.queryParam.limit)
              this.handleCurrentChange(this.queryParam.page)
            })
          } else {
            this.$message.error('Add record failed')
          }
          this.dialogFormVisible = false  // 关闭对话框
        })
      } else if(this.formType === 1) {  //更新记录
        updateBookType(this.form).then(res => {
          if(res === 1) {
            this.$message.success('Update record successfully')
            this.handleCurrentChange(this.queryParam.page)
          } else {
            this.$message.error('Update record failed')
          }
          this.dialogFormVisible = false  // 关闭对话框
        })
      }
    },

    // 删除记录
    handleDelete(row, index) {
      this.$confirm('Are you sure you want to delete this record?', 'Reminder', {
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
        type: 'warning'
      }).then(() => {
        deleteBookType(row).then(res => {
          if(res === 1) {
            this.$message.success('Record deleted successfully')
            this.tableData.splice(index, 1)
            // 如果删完了，获取上一页
            if(this.tableData.length === 0) {
              this.queryParam.page = this.queryParam.page - 1
              this.handleCurrentChange(this.queryParam.page)
            }
          } else {
            this.$message.error('Failed to delete the record')
          }
        })
      })
    },

    // 删除一些
    handleDeleteSome() {
      this.$confirm('Are you sure you want to delete those record?', 'Reminder', {
        confirmButtonText: 'Yes',
        cancelButtonText: 'No',
        type: 'warning'
      }).then(() => {
        // 获取选中的对象数组
        const items = this.$refs.multipleTable.selection
        deleteBookTypes(items).then(res => {
          if(res > 0) {
            this.$message.success('Delete' + res + ' records successfully')
            if(this.tableData.length === res) {  //如果本页内容全部删光了
              //当前页为上一页
              if(this.queryParam.page !== 0) {
                this.queryParam.page = this.queryParam.page - 1
              }
            }
            // 重载当前页
            this.handleCurrentChange(this.queryParam.page)
          } else {
            this.$message.error('Failed to delete those records')
          }
        })
      })
    },

  },
  data() {
    return {
      // 表格数据
      tableData: [],
      // 记录总数
      recordTotal: 0,
      // 查询参数
      queryParam: {
        page: 1,
        limit: 10,
        booktypename: null
      },
      // 对话框表单显示
      dialogFormVisible: false,
      // 表单类型（添加数据:0,修改数据:1）
      formType: 0,
      // 表单数据
      form: {
        bookid: null,
        booktypename: '',
        booktypedesc: ''
      },
      rules: {
        booktypename: [
          { required: true, message: 'Please Input ClassName', trigger: 'blur' }
        ],
        booktypedesc: [
          { required: true, message: 'Please Input ClassDescription', trigger: 'blur' }
        ]
      },
    }
  },
  computed: {
    // 获得user信息
    ...mapGetters(['id','name','roles']),
    // 通过表单类型计算表单标题
    formTitle() {
      return this.formType === 0 ? 'Add record' : 'Edit record'
    }
  }
}

</script>

<style scoped>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 150px;
    height: 200px;
    display: block;
  }
</style>
