; ModuleID = '../test_cases/typename.cl'
source_filename = "../test_cases/typename.cl"

@.str.5 = private unnamed_addr constant [1 x i8] c"\00", align 1
@.str.0 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"IO\00", align 1
@.str.10 = private unnamed_addr constant [35 x i8] c"
Divide by 0 exception at line no \00", align 1
@.str.12 = private unnamed_addr constant [26 x i8] c"
Abort called from class \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"
\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"
Dispatch to void at line no \00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%d
\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"String\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"Int\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"Bool\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"Object\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"Main\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%1024[^
]\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

%class.Object = type {i8*}
%class.A = type { %class.Object }
%class.B = type { %class.A }
%class.C = type { %class.B }
%class.IO = type { %class.Object }
%class.Main = type { %class.IO, %class.A*, %class.B*, %class.C*, %class.A*, %class.B*, %class.A* }


; Class: Main, Method: main
define i32 @_CN4Main_FN4main_(%class.Main* %this) {

entry:
  %0 = icmp eq %class.Main* %this, null
  br i1 %0, label %if.then, label %if.else

if.then:
  call void @print_dispatch_on_void_error(i32 19)
  call void @exit(i32 1)
  br label %if.end

if.else:
  br label %if.end

if.end:
  %1 = bitcast %class.Main* %this to %class.IO*
  %2 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %3 = load %class.A*, %class.A** %2, align 8
  %4 = icmp eq %class.A* %3, null
  br i1 %4, label %if.then.1, label %if.else.1

if.then.1:
  call void @print_dispatch_on_void_error(i32 19)
  call void @exit(i32 1)
  br label %if.end.1

if.else.1:
  br label %if.end.1

if.end.1:
  %5 = bitcast %class.A* %3 to %class.Object*
  %6 = call i8* @_CN6Object_FN9type_name_(%class.Object* %5)
  %7 = icmp eq i8* %6, null
  br i1 %7, label %if.then.2, label %if.else.2

if.then.2:
  call void @print_dispatch_on_void_error(i32 19)
  call void @exit(i32 1)
  br label %if.end.2

if.else.2:
  br label %if.end.2

if.end.2:
  %8 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %9 = call i8* @_CN6String_FN6concat_(i8* %6, i8* %8)
  %10 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %1, i8* %9)
  %11 = icmp eq %class.Main* %this, null
  br i1 %11, label %if.then.3, label %if.else.3

if.then.3:
  call void @print_dispatch_on_void_error(i32 20)
  call void @exit(i32 1)
  br label %if.end.3

if.else.3:
  br label %if.end.3

if.end.3:
  %12 = bitcast %class.Main* %this to %class.IO*
  %13 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %14 = load %class.B*, %class.B** %13, align 8
  %15 = icmp eq %class.B* %14, null
  br i1 %15, label %if.then.4, label %if.else.4

if.then.4:
  call void @print_dispatch_on_void_error(i32 20)
  call void @exit(i32 1)
  br label %if.end.4

if.else.4:
  br label %if.end.4

if.end.4:
  %16 = bitcast %class.B* %14 to %class.Object*
  %17 = call i8* @_CN6Object_FN9type_name_(%class.Object* %16)
  %18 = icmp eq i8* %17, null
  br i1 %18, label %if.then.5, label %if.else.5

if.then.5:
  call void @print_dispatch_on_void_error(i32 20)
  call void @exit(i32 1)
  br label %if.end.5

if.else.5:
  br label %if.end.5

if.end.5:
  %19 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %20 = call i8* @_CN6String_FN6concat_(i8* %17, i8* %19)
  %21 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %12, i8* %20)
  %22 = icmp eq %class.Main* %this, null
  br i1 %22, label %if.then.6, label %if.else.6

if.then.6:
  call void @print_dispatch_on_void_error(i32 21)
  call void @exit(i32 1)
  br label %if.end.6

if.else.6:
  br label %if.end.6

if.end.6:
  %23 = bitcast %class.Main* %this to %class.IO*
  %24 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %25 = load %class.C*, %class.C** %24, align 8
  %26 = icmp eq %class.C* %25, null
  br i1 %26, label %if.then.7, label %if.else.7

if.then.7:
  call void @print_dispatch_on_void_error(i32 21)
  call void @exit(i32 1)
  br label %if.end.7

if.else.7:
  br label %if.end.7

if.end.7:
  %27 = bitcast %class.C* %25 to %class.Object*
  %28 = call i8* @_CN6Object_FN9type_name_(%class.Object* %27)
  %29 = icmp eq i8* %28, null
  br i1 %29, label %if.then.8, label %if.else.8

if.then.8:
  call void @print_dispatch_on_void_error(i32 21)
  call void @exit(i32 1)
  br label %if.end.8

if.else.8:
  br label %if.end.8

if.end.8:
  %30 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %31 = call i8* @_CN6String_FN6concat_(i8* %28, i8* %30)
  %32 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %23, i8* %31)
  %33 = icmp eq %class.Main* %this, null
  br i1 %33, label %if.then.9, label %if.else.9

if.then.9:
  call void @print_dispatch_on_void_error(i32 22)
  call void @exit(i32 1)
  br label %if.end.9

if.else.9:
  br label %if.end.9

if.end.9:
  %34 = bitcast %class.Main* %this to %class.IO*
  %35 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %36 = load %class.A*, %class.A** %35, align 8
  %37 = icmp eq %class.A* %36, null
  br i1 %37, label %if.then.10, label %if.else.10

if.then.10:
  call void @print_dispatch_on_void_error(i32 22)
  call void @exit(i32 1)
  br label %if.end.10

if.else.10:
  br label %if.end.10

if.end.10:
  %38 = bitcast %class.A* %36 to %class.Object*
  %39 = call i8* @_CN6Object_FN9type_name_(%class.Object* %38)
  %40 = icmp eq i8* %39, null
  br i1 %40, label %if.then.11, label %if.else.11

if.then.11:
  call void @print_dispatch_on_void_error(i32 22)
  call void @exit(i32 1)
  br label %if.end.11

if.else.11:
  br label %if.end.11

if.end.11:
  %41 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %42 = call i8* @_CN6String_FN6concat_(i8* %39, i8* %41)
  %43 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %34, i8* %42)
  %44 = icmp eq %class.Main* %this, null
  br i1 %44, label %if.then.12, label %if.else.12

if.then.12:
  call void @print_dispatch_on_void_error(i32 23)
  call void @exit(i32 1)
  br label %if.end.12

if.else.12:
  br label %if.end.12

if.end.12:
  %45 = bitcast %class.Main* %this to %class.IO*
  %46 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 5
  %47 = load %class.B*, %class.B** %46, align 8
  %48 = icmp eq %class.B* %47, null
  br i1 %48, label %if.then.13, label %if.else.13

if.then.13:
  call void @print_dispatch_on_void_error(i32 23)
  call void @exit(i32 1)
  br label %if.end.13

if.else.13:
  br label %if.end.13

if.end.13:
  %49 = bitcast %class.B* %47 to %class.Object*
  %50 = call i8* @_CN6Object_FN9type_name_(%class.Object* %49)
  %51 = icmp eq i8* %50, null
  br i1 %51, label %if.then.14, label %if.else.14

if.then.14:
  call void @print_dispatch_on_void_error(i32 23)
  call void @exit(i32 1)
  br label %if.end.14

if.else.14:
  br label %if.end.14

if.end.14:
  %52 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %53 = call i8* @_CN6String_FN6concat_(i8* %50, i8* %52)
  %54 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %45, i8* %53)
  %55 = icmp eq %class.Main* %this, null
  br i1 %55, label %if.then.15, label %if.else.15

if.then.15:
  call void @print_dispatch_on_void_error(i32 24)
  call void @exit(i32 1)
  br label %if.end.15

if.else.15:
  br label %if.end.15

if.end.15:
  %56 = bitcast %class.Main* %this to %class.IO*
  %57 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 6
  %58 = load %class.A*, %class.A** %57, align 8
  %59 = icmp eq %class.A* %58, null
  br i1 %59, label %if.then.16, label %if.else.16

if.then.16:
  call void @print_dispatch_on_void_error(i32 24)
  call void @exit(i32 1)
  br label %if.end.16

if.else.16:
  br label %if.end.16

if.end.16:
  %60 = bitcast %class.A* %58 to %class.Object*
  %61 = call i8* @_CN6Object_FN9type_name_(%class.Object* %60)
  %62 = icmp eq i8* %61, null
  br i1 %62, label %if.then.17, label %if.else.17

if.then.17:
  call void @print_dispatch_on_void_error(i32 24)
  call void @exit(i32 1)
  br label %if.end.17

if.else.17:
  br label %if.end.17

if.end.17:
  %63 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %64 = call i8* @_CN6String_FN6concat_(i8* %61, i8* %63)
  %65 = call %class.IO* @_CN2IO_FN10out_string_(%class.IO* %56, i8* %64)
  %66 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %67 = load %class.A*, %class.A** %66, align 8
  %68 = icmp eq %class.A* %67, null
  br i1 %68, label %if.then.18, label %if.else.18

if.then.18:
  call void @print_dispatch_on_void_error(i32 25)
  call void @exit(i32 1)
  br label %if.end.18

if.else.18:
  br label %if.end.18

if.end.18:
  %69 = bitcast %class.A* %67 to %class.Object*
  %70 = call %class.Object* @_CN6Object_FN5abort_(%class.Object* %69)
  ret i32 0
}

; Constructor of class 'Object'
define void @_CN6Object_FN6Object_(%class.Object* %this) {

entry:
  ret void
}

; Constructor of class 'A'
define void @_CN1A_FN1A_(%class.A* %this) {

entry:
  %0 = bitcast %class.A* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  ret void
}

; Constructor of class 'B'
define void @_CN1B_FN1B_(%class.B* %this) {

entry:
  %0 = bitcast %class.B* %this to %class.A*
  call void @_CN1A_FN1A_(%class.A* %0)
  ret void
}

; Constructor of class 'C'
define void @_CN1C_FN1C_(%class.C* %this) {

entry:
  %0 = bitcast %class.C* %this to %class.B*
  call void @_CN1B_FN1B_(%class.B* %0)
  ret void
}

; Constructor of class 'IO'
define void @_CN2IO_FN2IO_(%class.IO* %this) {

entry:
  %0 = bitcast %class.IO* %this to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %0)
  ret void
}

; Constructor of class 'Main'
define void @_CN4Main_FN4Main_(%class.Main* %this) {

entry:
  %0 = bitcast %class.Main* %this to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %0)
  %1 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 1
  %2 = call noalias i8* @malloc(i64 8)
  %3 = bitcast i8* %2 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %3)
  %4 = bitcast %class.C* %3 to %class.Object*
  %5 = getelementptr inbounds %class.Object, %class.Object* %4, i32 0, i32 0
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %6, i8** %5, align 8
  %7 = bitcast %class.C* %3 to %class.A*
  store %class.A* %7, %class.A** %1, align 4
  %8 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 2
  %9 = call noalias i8* @malloc(i64 8)
  %10 = bitcast i8* %9 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %10)
  %11 = bitcast %class.C* %10 to %class.Object*
  %12 = getelementptr inbounds %class.Object, %class.Object* %11, i32 0, i32 0
  %13 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %13, i8** %12, align 8
  %14 = bitcast %class.C* %10 to %class.B*
  store %class.B* %14, %class.B** %8, align 4
  %15 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 3
  %16 = call noalias i8* @malloc(i64 8)
  %17 = bitcast i8* %16 to %class.C*
  call void @_CN1C_FN1C_(%class.C* %17)
  %18 = bitcast %class.C* %17 to %class.Object*
  %19 = getelementptr inbounds %class.Object, %class.Object* %18, i32 0, i32 0
  %20 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.2, i32 0, i32 0
  store i8* %20, i8** %19, align 8
  store %class.C* %17, %class.C** %15, align 4
  %21 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 4
  %22 = call noalias i8* @malloc(i64 8)
  %23 = bitcast i8* %22 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %23)
  %24 = bitcast %class.B* %23 to %class.Object*
  %25 = getelementptr inbounds %class.Object, %class.Object* %24, i32 0, i32 0
  %26 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  store i8* %26, i8** %25, align 8
  %27 = bitcast %class.B* %23 to %class.A*
  store %class.A* %27, %class.A** %21, align 4
  %28 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 5
  %29 = call noalias i8* @malloc(i64 8)
  %30 = bitcast i8* %29 to %class.B*
  call void @_CN1B_FN1B_(%class.B* %30)
  %31 = bitcast %class.B* %30 to %class.Object*
  %32 = getelementptr inbounds %class.Object, %class.Object* %31, i32 0, i32 0
  %33 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
  store i8* %33, i8** %32, align 8
  store %class.B* %30, %class.B** %28, align 4
  %34 = getelementptr inbounds %class.Main, %class.Main* %this, i32 0, i32 6
  %35 = call noalias i8* @malloc(i64 8)
  %36 = bitcast i8* %35 to %class.A*
  call void @_CN1A_FN1A_(%class.A* %36)
  %37 = bitcast %class.A* %36 to %class.Object*
  %38 = getelementptr inbounds %class.Object, %class.Object* %37, i32 0, i32 0
  %39 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
  store i8* %39, i8** %38, align 8
  store %class.A* %36, %class.A** %34, align 4
  ret void
}

; C malloc declaration
declare noalias i8* @malloc(i64)

; C exit declaration
declare void @exit(i32)

; C printf declaration
declare i32 @printf(i8*, ...)

; C scanf declaration
declare i32 @scanf(i8*, ...)

; C strlen declaration
declare i64 @strlen(i8*)

; C strcpy declaration
declare i8* @strcpy(i8*, i8*)

; C strcat declaration
declare i8* @strcat(i8*, i8*)

; C strncpy declaration
declare i8* @strncpy(i8*, i8*, i64)

; Class: Object, Method: abort
define %class.Object* @_CN6Object_FN5abort_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds %class.Object, %class.Object* %this, i32 0, i32 0
  %1 = load i8*, i8** %0, align 8
  %2 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %3 = getelementptr inbounds [26 x i8], [26 x i8]* @.str.12, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %2, i8* %3)
  %5 = call i32 (i8*, ...) @printf(i8* %2, i8* %1)
  %6 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %7 = call i32 (i8*, ...) @printf(i8* %2, i8* %6)
  call void @exit(i32 0)
  %8 = call noalias i8* @malloc(i64 8)
  %9 = bitcast i8* %8 to %class.Object*
  call void @_CN6Object_FN6Object_(%class.Object* %9)
  ret %class.Object* %9
}

; Class: Object, Method: type_name
define i8* @_CN6Object_FN9type_name_(%class.Object* %this) {
entry:
  %0 = getelementptr inbounds %class.Object, %class.Object* %this, i32 0, i32 0
  %1 = load i8*, i8** %0, align 8
  ret i8* %1
}

; Class: IO, Method: out_string
define %class.IO* @_CN2IO_FN10out_string_(%class.IO* %this, i8* %s) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i8* %s)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: out_int
define %class.IO* @_CN2IO_FN7out_int_(%class.IO* %this, i32 %d) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* %0, i32 %d)
  %1 = call noalias i8* @malloc(i64 8)
  %2 = bitcast i8* %1 to %class.IO*
  call void @_CN2IO_FN2IO_(%class.IO* %2)
  ret %class.IO* %2
}

; Class: IO, Method: in_int
define i32 @_CN2IO_FN6in_int_(%class.IO* %this) {
entry:
  %0 = alloca i32, align 8
  %1 = getelementptr inbounds [4 x i8], [4 x i8]* @.str.9, i32 0, i32 0
  %call = call i32 (i8*, ...) @scanf(i8* %1, i32* %0)
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

; Class: IO, Method: in_string
define i8* @_CN2IO_FN9in_string_(%class.IO* %this) {
entry:
  %0 = alloca i8*, align 8
  %1 = getelementptr inbounds [10 x i8], [10 x i8]* @.str.7, i32 0, i32 0
  %2 = load i8*, i8** %0, align 8
  %call = call i32 (i8*, ...) @scanf(i8* %1, i8* %2)
  %3 = load i8*, i8** %0, align 8
  ret i8* %3
}

; Class: String, Method: concat
define i8* @_CN6String_FN6concat_(i8* %s1, i8* %s2) {
entry:
  %0 = call i64 @strlen(i8* %s1)
  %1 = call i64 @strlen(i8* %s2)
  %2 = add nsw i64 %0, %1
  %3 = add nsw i64 %2, 1
  %4 = call noalias i8* @malloc(i64 %3)
  %5 = call i8* @strcpy(i8* %4, i8* %s1)
  %6 = call i8* @strcat(i8* %4, i8* %s2)
  ret i8* %4
}

; Class: String, Method: substr
define i8* @_CN6String_FN6substr_(i8* %s1, i32 %index, i32 %len) {
entry:
  %0 = zext i32 %len to i64
  %1 = call noalias i8* @malloc(i64 %0)
  %2 = getelementptr inbounds i8, i8* %s1, i32 %index
  %3 = call i8* @strncpy(i8* %1, i8* %2, i64 %0)
  ret i8* %1
}
define void @print_div_by_zero_err_msg(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %1 = getelementptr inbounds [35 x i8], [35 x i8]* @.str.10, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}
define void @print_dispatch_on_void_error(i32 %lineNo) {
entry:
  %0 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.6, i32 0, i32 0
  %1 = getelementptr inbounds [30 x i8], [30 x i8]* @.str.11, i32 0, i32 0
  %2 = call i32 (i8*, ...) @printf(i8* %0, i8* %1)
  %3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str.8, i32 0, i32 0
  %4 = call i32 (i8*, ...) @printf(i8* %3, i32 %lineNo)
  %5 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i32 0, i32 0
  %6 = call i32 (i8*, ...) @printf(i8* %0, i8* %5)
  ret void
}

; C main() function
define i32 @main() {
entry:
  %main = alloca %class.Main, align 8
  call void @_CN4Main_FN4Main_(%class.Main* %main)
  %retval = call i32 @_CN4Main_FN4main_(%class.Main* %main)
  ret i32 %retval
}