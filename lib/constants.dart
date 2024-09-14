// ignore_for_file: constant_identifier_names

//App State
import 'package:get/get.dart';

const APPNAME = "Htunpauk";

//Api
const HTTPSPREFIX = "https://";
const APIBASEURL = "fms-dev-api.hostingtps.online";
// const APIBASEURL = "192.168.100.26:5002";
const SERVERTIMEOUTSEC = 30;

//OTP
const OTPRESENDCNTSEC = 60;
const OTPSIZE = 6;
const ISTESTING = true;
const kCurrentDBVersion = 1;
const kDBName = "rps.db";
const kSPlashSecond = 2;
const MAXFILEUPLOADSIZE = 8 * 1024 * 1024;
// const USERUPLOADEDIMAGESCNT = 4;
const ATTACHMENTCNT = 4;

//setup flags
const ONBOARDINGKEY = "onboardingkey";
const TNCKEY = "tnckey";
const FIRSTTIMEOPTIONPICK = "firsttimeoptionpick";
const FIRSTTIMEPROFILESHOW = "firsttimeprofileshow";
const INTERLOGIN = "internallogin";
const TOKENKEY = 'token';

//UserBio key
const USERBIO = 'userbio';

//social key
const USERKEY = 'userkey';
const APPLEUSERKEY = "appleuserkey";
// const AUTH =
//     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjY3M2ZjMmY4Yzg1MTc0YmY2MDI4YzU4IiwiYWNjZXNzX2tleSI6ImMwNmM4NzVlY2E4ZTEzM2Y4NTJjMzNmOGMyM2QzMjFiOjgxYTZhZjNmNDg4MWQ0NmY3YmM4ODcyYzNkYmYxNTFiIiwibG9naW5fdHlwZSI6Imdvb2dsZSIsInVzZXJfYWdlbnQiOiJQb3N0bWFuIERlc2t0b3AiLCJpcF9hZGRyZXNzIjoiOjpmZmZmOjEyNy4wLjAuMSIsInRva2VuX3R5cGUiOiJhY2Nlc3MiLCJpYXQiOjE3MTkxNTU2MTAsImV4cCI6MTc1MDY5MTYxMH0.0jXAR0-Gsruyn80o1ptfre4sdrX9gF-xcQOVC-V7R1M";

//Global properties
final isTablet = Get.width > 600 ? true : false;
