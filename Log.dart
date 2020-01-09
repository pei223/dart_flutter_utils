const logging = true;

infoLog(var msg) {
  if (!logging) {
    return;
  }
  _logWithStackTrace("[INFO] " + msg);
}

warnLog(var msg) {
  if (!logging) {
    return;
  }
  _logWithStackTrace("[WARN] " + msg);
}

errorLog(var msg) {
  if (!logging) {
    return;
  }
  _logWithStackTrace("[ERROR] " + msg);
}

_logWithStackTrace(var msg) {
  if (!logging) {
    return;
  }
  try {
    String stackTrace = StackTrace.current.toString();
    String topStack = stackTrace.split("#2")[1].split("#3")[0];
    print(
        "[${topStack.substring(topStack.lastIndexOf("(") + 1, topStack.indexOf(")")).trim()}]:${msg.toString()}");
  } catch (e) {
    print("Logging error. " + e == null ? "" : e.toString());
  }
}


