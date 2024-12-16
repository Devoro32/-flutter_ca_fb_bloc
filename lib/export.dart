//!packages
export 'package:flutter/material.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:ca_firebase_app/firebase_options.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:get_it/get_it.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:ca_firebase_app/init_dependencies.dart';
export 'package:equatable/equatable.dart';

//!core
export 'package:ca_firebase_app/Core/themes/theme.dart';
export 'package:ca_firebase_app/Core/themes/app_pallete.dart';
export 'package:ca_firebase_app/Core/utils/show_snackbar.dart';
export 'package:ca_firebase_app/Core/widgets/loader.dart';
export 'package:ca_firebase_app/Core/error/failures.dart';
export 'package:ca_firebase_app/Core/usecases/core_usecases.dart';
export 'package:ca_firebase_app/Core/bloc_cubit/app_user/app_user_cubit.dart';
export 'package:ca_firebase_app/Core/utils/constants.dart';
//!auth

//data
export 'package:ca_firebase_app/features/auth/data/model/user_creation_model.dart';
export 'package:ca_firebase_app/features/auth/data/model/user_signin_model.dart';
export 'package:ca_firebase_app/features/auth/data/model/user_model.dart';
export 'package:ca_firebase_app/features/auth/data/datasource/auth_firebase_services.dart';
export 'package:ca_firebase_app/features/auth/data/repository/auth_repository_impl.dart';
//domain
export 'package:ca_firebase_app/features/auth/domain/repository/auth_repository.dart';
export 'package:ca_firebase_app/features/auth/domain/Usecases/auth_get_user_uc.dart';
export 'package:ca_firebase_app/features/auth/domain/Usecases/auth_signup_uc.dart';
export 'package:ca_firebase_app/features/auth/domain/Usecases/auth_signin_uc.dart';
export 'package:ca_firebase_app/features/auth/domain/Usecases/auth_send_pw_reset_uc.dart';
export 'package:ca_firebase_app/features/auth/domain/Usecases/auth_is_logged_in_uc.dart';

//Entity
export 'package:ca_firebase_app/features/auth/domain/Entity/user_entity.dart';
//presentation
export 'package:ca_firebase_app/features/auth/presentation/pages/login_page.dart';
export 'package:ca_firebase_app/features/auth/presentation/pages/signup_page.dart';
export 'package:ca_firebase_app/features/auth/presentation/bloc/auth_bloc.dart';
export 'package:ca_firebase_app/features/auth/presentation/widgets/auth_field.dart';
export 'package:ca_firebase_app/features/auth/presentation/widgets/auth_gradient_button.dart';

//!Home

//presentatin

export 'package:ca_firebase_app/features/home/presentation/pages/homepage.dart';

//!Authentication

//core
export 'package:ca_firebase_app/Core/error/dbexceptions.dart';
export 'package:ca_firebase_app/Core/error/dbfailure.dart';
export 'package:ca_firebase_app/Core/usecases/usecase.dart';
export 'package:ca_firebase_app/Core/utils/typedef.dart';
//data

export 'package:ca_firebase_app/features/authentication/data/repositories/authentication_repository_implementation.dart';
export 'package:ca_firebase_app/features/authentication/data/models/user_model.dart';
export 'package:ca_firebase_app/features/authentication/data/datasources/authentication_remote_data_source.dart';
export 'package:ca_firebase_app/features/authentication/data/models/db_user_creation_req_mod.dart';
//domain
export 'package:ca_firebase_app/features/authentication/domain/entities/user.dart';
export 'package:ca_firebase_app/features/authentication/domain/repositories/authentication_repository.dart';
export 'package:ca_firebase_app/features/authentication/domain/usecases/get_users.dart';
export 'package:ca_firebase_app/features/authentication/domain/usecases/create_user.dart';
//presentation
export 'package:ca_firebase_app/features/authentication/presentation/views/home_screen.dart';
export 'package:ca_firebase_app/features/authentication/presentation/widgets/add_user_dialog.dart';
export 'package:ca_firebase_app/features/authentication/presentation/widgets/loading_column.dart';

//cubit/bloc
export 'package:ca_firebase_app/features/authentication/presentation/cubit/authentication_cubit.dart';
export 'package:ca_firebase_app/features/authentication/presentation/bloc/authentication_bloc.dart';
