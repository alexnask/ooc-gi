use gi
import gi/[SignalInfo, CallableInfo, FunctionInfo]

VFuncInfoFlags: extern(GIVFuncInfoFlags) enum {
    mustChainUp: extern(GI_VFUNC_MUST_CHAIN_UP),
    mustOverride: extern(GI_VFUNC_MUST_OVERRIDE),
    mustNotOverride: extern(GI_VFUNC_MUST_NOT_OVERRIDE),
    throws: extern(GI_VFUNC_THROWS)
}

VFuncInfo: cover from GIVFuncInfo* extends CallableInfo {
    getFlags: extern(g_vfunc_info_get_flags) func -> VFuncInfoFlags
    getOffset: extern(g_vfunc_info_get_offset) func -> Int
    getSignal: extern(g_vfunc_info_get_signal) func -> SignalInfo
    getInvoker: extern(g_vfunc_get_invoker) -> FunctionInfo
}
