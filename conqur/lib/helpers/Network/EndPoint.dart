enum EndPoint {
  login,
  signUp,
  verifyOtp,
  resendOtp,
  termsAgreed,
  userDetails,
  bodyMetrics,
  activeSession,
  startSession,
  updateCalibrationStatus,
  stopSession,
  uploadData,
  addEvent,
  getEvents,
  getEventDetail,
  getEventSuggestions,
  deleteEvent,
  updateEvent,
  logout,
  deactivateProfile,
  uploadDisplayPicture,
  userEvents,
  userSessions,
  allReports,
  calendarInfo,
  sessionDetail,
  updateWeight,
  updateHeight,
  loggedEntry,
  weightTracker,
  reportsScore,
  updateUser,
  recentSession,
  dashboard,
  reportDetail
}

extension IEndPoint on EndPoint {
  String get url {
    switch (this) {
      case EndPoint.login:
        return "/users/login";
      case EndPoint.signUp:
        return "/users/login";
      case EndPoint.verifyOtp:
        return "/users/verifyOtp";
      case EndPoint.resendOtp:
        return "/users/resendOtp";
      case EndPoint.termsAgreed:
        return "/users/termsAgreed";
      case EndPoint.userDetails:
        return "/users/userDetails";
      case EndPoint.bodyMetrics:
        return "/users/bodyMetrics";
      case EndPoint.activeSession:
        return "/bluetooth/activeSession";
      case EndPoint.startSession:
        return "/bluetooth/startSession";
      case EndPoint.updateCalibrationStatus:
        return "/bluetooth/updateCalibrationStatus";
      case EndPoint.stopSession:
        return "/bluetooth/stopSession";
      case EndPoint.uploadData:
        return "/bluetooth/uploadData";
      case EndPoint.addEvent:
        return "/activity/add_event_details";
      case EndPoint.getEvents:
        return "/activity/session_events";
      case EndPoint.getEventSuggestions:
        return "/activity/event_suggestions";
      case EndPoint.getEventDetail:
        return "/activity/get_event";
      case EndPoint.deleteEvent:
        return "/activity/delete_event";
      case EndPoint.updateEvent:
        return "/activity/update_event";
      case EndPoint.logout:
        return "/users/logout";
      case EndPoint.deactivateProfile:
        return "/users/deactivateProfile";
      case EndPoint.uploadDisplayPicture:
        return "/users/uploadDisplayPicture";
      case EndPoint.userEvents:
        return "/activity/user_events";
      case EndPoint.allReports:
        return "/report/all_reports";
      case EndPoint.calendarInfo:
        return "/report/calendar_info";
      case EndPoint.userSessions:
        return "/bluetooth/userSessions";
      case EndPoint.sessionDetail:
        return "/bluetooth/session_detail";
      case EndPoint.updateHeight:
        return "/users/update_height";
      case EndPoint.updateWeight:
        return "/users/update_weight";
      case EndPoint.loggedEntry:
        return "/users/logged_entries";
      case EndPoint.weightTracker:
        return "/users/weight_tracker_card";
      case EndPoint.reportsScore:
        return "/report/get_report_finalscores";
      case EndPoint.updateUser:
        return "/users/uploadUserInfo";
      case EndPoint.recentSession:
        return "/report/get_recent_session";
      case EndPoint.dashboard:
        return "/bluetooth/dashboard";
      case EndPoint.reportDetail:
        return "/report/get_report_details";
    }
  }
}
