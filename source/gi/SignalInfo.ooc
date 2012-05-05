use gi
import gi/[CallableInfo, VFuncInfo]


SignalFlags: extern(GSignalFlags) eum {
    runFirst: extern(G_SIGNAL_RUN_FIRST),
    runLast: extern(G_SIGNAL_RUN_LAST),
    runCleanup: extern(G_SIGNAL_RUN_CLEANUP),
    noRecurse: extern(G_SIGNAL_NO_RECURSE),
    detailed: extern(G_SIGNAL_DETAILED),
    action: extern(G_SIGNAL_ACTION),
    noHooks: extern(G_SIGNAL_NO_HOOKS),
    mustCollect: extern(G_SIGNAL_MUST_COLLECT),
    deprecated: extern(G_SIGNAL_DEPRECATED)
}

SignalInfo: cover from GISignalInfo* extends CallableInfo {
    getFlags: extern(g_signal_info_get_flags) func -> SignalFlags
    getClassClosure: extern(g_signal_info_get_class_closure) func -> VFuncInfo
    trueStopsEmit: extern(g_signal_info_true_stop_emit) func -> Bool
}
