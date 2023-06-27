<template>
    <div class="dor_up_container" >
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="ID">
                <el-input v-model="ruleForm.id"></el-input>
            </el-form-item>
            <el-form-item label="名称" prop="name">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
            <el-form-item label="联系电话" prop="telephone">
                <el-input v-model="ruleForm.telephone"></el-input>
            </el-form-item>
            <el-form-item>
                <dic class="dor_up_button">
                    <el-button type="primary" @click="submitForm('ruleForm')">立即修改</el-button>
                    <el-button @click="resetForm('ruleForm')">重置</el-button>
                </dic>
                
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
                    id: '',
                    buildingId: '',
                    name: '',
                    type: '',
                    telephone: ''
                },
                rules: {
                    buildingId: [
                        { required: true, message: '请选择楼宇', trigger: 'change' }
                    ],
                    name: [
                        { required: true, message: '请输入名称', trigger: 'blur' }
                    ],
                    telephone: [
                        { required: true, message: '请输入联系电话', trigger: 'blur' }
                    ],
                    type: [
                        { required: true, message: '请选择几人间', trigger: 'change' }
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        axios.put('http://172.20.10.8:8181/dormitory/update',_this.ruleForm).then(function (resp) {
                            if(resp.data.code == 0){
                                _this.$alert(_this.ruleForm.name+'修改成功', '', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        _this.$router.push('/dormitoryManager')
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
            axios.get('http://172.20.10.8:8181/dormitory/findById/'+_this.$route.query.id).then(function (resp) {
                _this.ruleForm = resp.data.data
            })
        }
    }
</script>

<style>
.dor_up_container{
    margin: 0 auto;
    width: 500px;
    /* height: 700px; */
    border:0px solid red;
    margin-top:80px;
    padding:20px;
}
.dor_up_button{
    display: flex;
    justify-content:center;
    margin-top:20px;
}

</style>