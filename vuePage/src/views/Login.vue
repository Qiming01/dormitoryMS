<template>
    <div class="login-bg">
        <div class="login-container">
            <el-form :model="ruleForm" :rules="rules" status-icon ref="ruleForm" label-position="left" label-width="0px"
                class="demo-ruleForm login-page">
                <h3 class="title" style="text-align: center; font-size:x-large;">系统登录</h3>
                <el-form-item prop="username">
                    <el-input type="text" v-model="ruleForm.username" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input type="password" v-model="ruleForm.password" placeholder="密码"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-radio v-model="type" style="left: 10%; float: left;" label="systemAdmin">系统管理员</el-radio>
                    <el-radio v-model="type" style="right: 10%; float: right;" label="dormitoryAdmin">宿舍管理员</el-radio>
                </el-form-item>
                <el-form-item style="width:100%;">
                    <el-button type="primary" style="width:100%;" @click="handleSubmit" :loading="logining">登录</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script>
export default {
    name: "Login",
    data() {
        return {
            logining: false,
            ruleForm: {
                username: '',
                password: ''
            },
            type: 'systemAdmin',
            rules: {
                username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
                password: [{ required: true, message: '请输入密码', trigger: 'blur' }]
            }
        }
    },
    methods: {
        handleSubmit() {
            this.$refs.ruleForm.validate((valid) => {
                if (valid) {
                    this.logining = true
                    let _this = this
                    if (_this.type == 'dormitoryAdmin') {
                        axios.get('http://172.20.10.8:8181/dormitoryAdmin/login', { params: _this.ruleForm }).then(function (resp) {
                            _this.logining = false
                            if (resp.data.code == -1) {
                                _this.$alert('用户名不存在', '提示', {
                                    confirmButtonText: '确定'
                                })
                            }
                            if (resp.data.code == -2) {
                                _this.$alert('密码错误', '提示', {
                                    confirmButtonText: '确定'
                                })
                            }
                            if (resp.data.code == 0) {
                                //跳转到SystemAdmin
                                //展示当前登录用户信息
                                localStorage.setItem('dormitoryAdmin', JSON.stringify(resp.data.data));
                                _this.$router.replace({ path: '/dormitoryAdmin' })
                            }
                        })
                    }
                    if (_this.type == 'systemAdmin') {
                        axios.get('http://172.20.10.8:8181/systemAdmin/login', { params: _this.ruleForm }).then(function (resp) {
                            _this.logining = false
                            if (resp.data.code == -1) {
                                _this.$alert('用户名不存在', '提示', {
                                    confirmButtonText: '确定'
                                })
                            }
                            if (resp.data.code == -2) {
                                _this.$alert('密码错误', '提示', {
                                    confirmButtonText: '确定'
                                })
                            }
                            if (resp.data.code == 0) {
                                //跳转到SystemAdmin
                                //展示当前登录用户信息
                                localStorage.setItem('systemAdmin', JSON.stringify(resp.data.data));
                                _this.$router.replace({ path: '/systemAdmin' })
                            }
                        })
                    }
                }
            })
        }
    }
};
</script>

<style scoped>
.login-container {
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.login-bg {
    background: url(../assets/background.webp) no-repeat;
    background-size: cover;
    width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
}

.login-page::before,
.login-page::after {
    content: "";
    position: absolute;
    top: 15%;
    left: 33%;
    right: 33%;
    bottom: 50%;
    z-index: -1;
    border-radius: 20px;
}

.login-page::before {
    border: 200px solid #5398f8;
    transform: rotate(3deg);
}

.login-page::after {
    border: 200px solid #f36465;
    transform: rotate(-3deg);
}


.login-page {
    -webkit-border-radius: 5px;
    top: 30%;
    border-radius: 5px;
    margin: 10% auto;
    width: 30%;
    height: 40%;
    padding: 35px 35px 15px;
    background: #eceef0;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
}

label.el-checkbox.rememberme {
    margin: 0px 0px 15px;
    text-align: center;
}
</style>