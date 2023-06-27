<template>
    <el-container class="home_container">
        <el-header class="home_header">
            <div class="home_title">HFUT 公寓管理系统</div>
            <div class="home_userinfoContainer">
                <el-dropdown>
                    <span class="el-dropdown-link home_userinfo">
                        {{ admin.name }}<i class="el-icon-arrow-down el-icon--right home_userinfo"></i>
                    </span>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item @click.native="logout">退出登录</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
            </div>
        </el-header>
        <el-container class="bg">
            <el-aside width="15%">
                <el-menu router class="side-menu">
                    <el-submenu index="1">
                        <template slot="title"><i class="el-icon-s-platform"
                                background-color=transparent></i>宿管模块</template>
                        <el-menu-item index="/dormitoryAdminAdd"
                            :class="$route.path == '/dormitoryAdminAdd' ? 'is-active' : ''">
                            <i class="el-icon-folder-add" background-color=transparent></i>添加宿管
                        </el-menu-item>
                        <el-menu-item index="/dormitoryAdminManager"
                            :class="$route.path == '/dormitoryAdminManager' ? 'is-active' : ''">
                            <i class="el-icon-document-copy" background-color=transparent></i>宿管管理
                        </el-menu-item>
                    </el-submenu>
                    <el-submenu index="2">
                        <template slot="title"><i class="el-icon-user-solid"></i>学生模块</template>
                        <el-menu-item index="/studentAdd" :class="$route.path == '/studentAdd' ? 'is-active' : ''">
                            <i class="el-icon-folder-add"></i>添加学生
                        </el-menu-item>
                        <el-menu-item index="/studentManager">
                            <i class="el-icon-document-copy"></i>学生管理
                        </el-menu-item>
                    </el-submenu>

                    <el-submenu index="3">
                        <template slot="title"><i class="el-icon-s-grid"></i>楼宇模块</template>
                        <el-menu-item index="/buildingAdd">
                            <i class="el-icon-folder-add"></i>添加楼宇
                        </el-menu-item>
                        <el-menu-item index="/buildingManager">
                            <i class="el-icon-document-copy"></i>楼宇管理
                        </el-menu-item>
                    </el-submenu>

                    <el-submenu index="4">
                        <template slot="title"><i class="el-icon-s-home"></i>宿舍模块</template>
                        <el-menu-item index="/dormitoryAdd">
                            <i class="el-icon-folder-add"></i>添加宿舍
                        </el-menu-item>
                        <el-menu-item index="/dormitoryManager">
                            <i class="el-icon-document-copy"></i>宿舍管理
                        </el-menu-item>
                    </el-submenu>

                    <el-menu-item index="/moveoutRegister">
                        <i class="el-icon-s-unfold"></i>
                        <span slot="title">学生迁出登记</span>
                    </el-menu-item>
                    <el-menu-item index="/moveoutRecord">
                        <i class="el-icon-s-order"></i>
                        <span slot="title">学生迁出记录</span>
                    </el-menu-item>

                    <el-menu-item index="/absentRecord">
                        <i class="el-icon-error"></i>
                        <span slot="title">学生缺寝记录</span>
                    </el-menu-item>
                    <el-menu-item index="/FixRecord">
                        <i class="el-icon-s-cooperation"></i>
                        <span slot="title">维修记录</span>
                    </el-menu-item>
                </el-menu>

            </el-aside>

            <el-container>
                <el-main>
                    <el-container class="table-bg">
                        <!-- <el-breadcrumb separator-class="el-icon-arrow-right">
                            <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
                            <el-breadcrumb-item v-text="this.$router.currentRoute.name"></el-breadcrumb-item>
                        </el-breadcrumb> -->
                        <router-view></router-view>
                    </el-container>

                </el-main>
            </el-container>
        
        </el-container>
        

    </el-container>
</template>
<script>
export default {
    methods: {
        logout() {
            let _this = this;
            this.$confirm('注销登录吗?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(function () {
                localStorage.removeItem('systemAdmin')
                _this.$router.replace({ path: '/login' })
            })
        }
    },
    data() {
        return {
            admin: ''
        }
    },
    created() {
        let admin = JSON.parse(window.localStorage.getItem('systemAdmin'))
        this.admin = admin
    }
}
</script>
<style>
.home_container {
    height: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
}

.home_header {
    background-color: #FFFFFF;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.home_title {
    color: #00adeb;
    font-size: 22px;
    display: inline;
}

.home_userinfo {
    color: black;
    cursor: pointer;
}

.home_userinfoContainer {
    display: inline;
    margin-right: 20px;
}

.bg {
    background-image: url("../assets/bg.png");
    background-size: cover;
}

.transparent-container {
    background-color: transparent !important;
}

.home_footer {
    background-color: transparent;
    color: #000000;
    font-size: 18px;
    line-height: 60px;
    text-align: center;
}

.table-bg {
    background-color: #FFFFFF;
    border-radius: 25px;
}

.side-menu {
    top: 20px;
    left: 10px;
    border-radius: 10px;
}
</style>
