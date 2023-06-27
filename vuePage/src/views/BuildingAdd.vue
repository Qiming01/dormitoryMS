<template>
    <div class="build_add_container">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="名称" prop="name">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="介绍" prop="introduction">
                <el-input v-model="ruleForm.introduction"></el-input>
            </el-form-item>
            <el-form-item label="管理员" prop="adminId">
                <el-select v-model="ruleForm.adminId" placeholder="请选择管理员">
                    <el-option v-for="item in dormitoryAdminList" :label="item.name" :value="item.id"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <div class="build_add_button">
                    <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
                    <el-button @click="resetForm('ruleForm')">重置</el-button>
                </div>
               
            </el-form-item>
        </el-form>
    </div>

</template>

<script>
    export default {
        data() {
            return {
                category:null,
                ruleForm: {
                    name: '',
                    introduction: '',
                    adminId: ''
                },
                dormitoryAdminList: '',
                rules: {
                    name: [
                        { required: true, message: '请输入名称', trigger: 'blur' }
                    ],
                    introduction: [
                        { required: true, message: '请输入介绍', trigger: 'blur' }
                    ],
                    adminId: [
                        { required: true, message: '请选择管理员', trigger: 'change' }
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        axios.post('http://172.20.10.8:8181/building/save',_this.ruleForm).then(function (resp) {
                            if(resp.data.code == 0){
                                _this.$alert(_this.ruleForm.name+'添加成功', '', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        _this.$router.push('/buildingManager')
                                    }
                                });
                            }
                        })
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            }
        },
        created() {
            const _this = this
            axios.get('http://172.20.10.8:8181/dormitoryAdmin/list').then(function (resp) {
                _this.dormitoryAdminList = resp.data.data
            })
        }
    }
</script>

<style>
.build_add_container{
    margin: 0 auto;
    width: 500px;
    /* height: 700px; */
    border:0px solid red;
    margin-top:80px;
    padding:20px;
}
.build_add_button{
    display: flex;
    justify-content:center;
    margin-top:20px;
}

</style>