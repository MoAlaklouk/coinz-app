import 'dart:developer' as developer;

import '../api_key.dart';

const developmentMode = true;

/// print request error in debug console
printRequestError({error, time}) {
  if (developmentMode) {
    developer.log('🛑 \x1B[31m ******** Request Error ********* 🛑');
    developer.log('\x1B[35m Time : \x1B[37m $time  \x1B[33m milliseconds');
    developer.log('\x1B[35m Response :\x1B[37m $error');
    developer.log(' \x1B[31m ************* END ************** ');
  } else {
    return true;
  }
}

/// print successes response in debug console
printSuccessesResponse({response, time}) {
  if (developmentMode) {
    developer.log('📗\x1B[32m ******** Successe Request **********📗');
    developer.log('\x1B[35m Time : \x1B[37m $time  \x1B[33m milliseconds');
    developer.log('\x1B[35m Response :\x1B[37m $response');
    developer.log('\x1B[32m  *************** END **************');
  } else {
    return true;
  }
}

/// print request details
showRequestDetails({
  method,
  path,
  body,
  queryParameters,
}) {
  if (developmentMode) {
    developer.log('📘\x1B[36m ******** Request Details **********📘');
    developer.log('\x1B[35m Full URL: \x1B[37m $baseUrl$path');
    developer.log('\x1B[35m Method: \x1B[37m $method');
    developer.log('\x1B[35m Path: \x1B[37m $path');
    developer.log('\x1B[35m Body: \x1B[37m $body');
    developer.log('\x1B[35m QueryParameters: \x1B[37m $queryParameters');
    developer.log('\x1B[36m  *************** END **************');
  } else {
    return true;
  }
}

/// print error response in debug console
printErrorResponse(error) {
  if (developmentMode) {
    developer.log('\x1B[31m **** Request catch another error ****');
    developer.log('\x1B[33m Error>> $error');
    developer.log('\x1B[31m ***************************');
  } else {
    return true;
  }
}

consoleLog(value) {
  if (developmentMode) {
    developer.log('📔:\x1B[32m ******** Log Value **********:📔');
    developer.log('\x1B[35m Response :\x1B[37m $value');
    developer.log('📓:\x1B[32m  *************** END **************:📓');
  } else {
    return true;
  }
}


//  *** Emoji Type ***
// 📕: error message
// 📙: warning message
// 📗: ok status message
// 📘: action message
// 📓: canceled status message
// 📔: Or anything you like and want to recognize immediately by color

//  *** Colorfull print text ***
// Black:   \x1B[30m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Magenta: \x1B[35m
// Cyan:    \x1B[36m
// White:   \x1B[37m
// Reset:   \x1B[0m
