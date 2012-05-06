use gi
import gi/[CallableInfo, PropertyInfo, VFuncInfo]

InvokeError: extern(GInvokeError) enum {
    failed: extern(G_INVOKE_ERROR_FAILED),
    symbolNotFound: extern(G_INVOKE_ERROR_SYMBOL_NOT_FOUND),
    argumentMismatch: extern(G_INVOKE_ERROR_ARGUMENT_MISMATCH)
}

FunctionInfoFlags: extern(GIFunctionInfoFlags) enum {
    isMethod?: extern(GI_FUNCTION_IS_METHOD),
    isConstructor?: extern(GI_FUNCTION_IS_CONSTRUCTOR),
    isGetter?: extern(GI_FUNCTION_IS_GETTER),
    isSetter?: extern(GI_FUNCTION_IS_SETTER),
    wrapsVfunc?: extern(GI_FUNCTION_WRAPS_VFUNC),
    throws?: extern(GI_FUNCTION_THROWS)
}

FunctionInfo: cover from GIFunctionInfo* extends CallableInfo {
    getSymbol: extern(g_function_info_get_symbol) func -> CString
    getFlags: extern(g_function_info_get_flags) func -> FunctionInfoFlags
    getProperty: extern(g_function_info_get_property) func -> PropertyInfo
    getVFunc: extern(g_function_info_get_vfunv) func -> VFuncInfo
}
