<script setup>
import { Link , usePage} from '@inertiajs/vue3';
const page = usePage();
</script>

<template>
    <div class="container-fluid bg-primary px-5 d-none d-lg-block">
        <div class="row gx-0">
            <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
                <div
                    class="d-inline-flex align-items-center"
                    style="height: 45px"
                >
                    <a
                        class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
                        href=""
                        ><i class="fab fa-twitter fw-normal"></i
                    ></a>
                    <a
                        class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
                        href=""
                        ><i class="fab fa-facebook-f fw-normal"></i
                    ></a>
                    <a
                        class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
                        href=""
                        ><i class="fab fa-linkedin-in fw-normal"></i
                    ></a>
                    <a
                        class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2"
                        href=""
                        ><i class="fab fa-instagram fw-normal"></i
                    ></a>
                    <a
                        class="btn btn-sm btn-outline-light btn-sm-square rounded-circle"
                        href=""
                        ><i class="fab fa-youtube fw-normal"></i
                    ></a>
                </div>
            </div>
            <div class="col-lg-4 text-center text-lg-end">
                <div
                    class="d-inline-flex align-items-center"
                    style="height: 45px"
                >
                    <Link v-if="page.props.user.login==false" href="/register"
                        ><small class="me-3 text-light"
                            ><i class="fa fa-user me-2"></i>Register</small
                        ></Link
                    >
                    <Link v-if="page.props.user.login==false" href="/login"
                        ><small class="me-3 text-light"
                            ><i class="fa fa-sign-in-alt me-2"></i>Login</small
                        ></Link
                    >
                    <Link v-if="page.props.user.login==true" href="/logout"
                        ><small class="me-3 text-light"
                            ><i class="fa fa-sign-in-alt me-2"></i>Logout</small
                    ></Link
                    >
                    <div class="dropdown">
                        <Link v-if="page.props.user.login==true"
                            :href="page.props.user.authUser.user_type == 'admin' ? '/admin/dashboard' : '/student/dashboard'"
                            class="dropdown-toggle text-light"
                            ><small
                                ><i class="fa fa-home me-2"></i> My
                                Dashboard</small
                            ></Link
                        >
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped></style>
