library data_access;

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:my_bros_flutter/core/app_exception.dart';
import 'package:my_bros_flutter/model/model.dart';

part 'miscs/requestor.dart';
part 'repositories/app_repository/app_abstract_repository.dart';
part 'repositories/app_repository/app_concrete_repository.dart';
part 'repositories/auth_repossitory/auth_abstract_repository.dart';
part 'repositories/auth_repossitory/auth_concrete_repository.dart';
