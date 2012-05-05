use gi
import gi/[BaseInfo, RegisteredTypeInfo, PropertyInfo, FunctionInfo, SignalInfo, VFuncInfo, ConstantInfo, StructInfo]

InterfaceInfo: cover from GInterfaceInfo* extends RegisteredTypeInfo {
    getNPrerequisites: extern(g_interface_info_get_n_prerequisites) func -> Int
    getPrerequisite: extern(g_interface_info_get_prerequisite) func(n: Int) -> BaseInfo
    getNProperties: extern(g_interface_info_get_n_properties) func -> Int
    getProperty: extern(g_interface_info_get_property) func(n: Int) -> PropertyInfo
    getNMethods: extern(g_interface_info_get_n_methods) func -> Int
    getMethod: extern(g_interface_info_get_method) func(n: Int) -> FunctionInfo
    findMethod: extern(g_interface_find_method) func(name: CString) -> FunctionInfo
    getNSignals: extern(g_interface_info_get_n_signals) func -> Int
    getSignal: extern(g_interface_info_get_signal) func(n: Int) -> SignalInfo
    getNVFuncs: extern(g_interface_info_get_n_vfuncs) func -> Int
    getVFunc: extern(g_interface_info_get_vfunc) func(n: Int) -> VFuncInfo
    getNConstants: extern(g_interface_info_get_n_constants) func -> Int
    getConstant: extern(g_interface_info_get_constant) func(n: Int) -> ConstantInfo
    getIfaceStruct: extern(g_interface_info_get_iface_struct) func -> StructInfo
    findVFunc: extern(g_interface_info_find_vfunc) func(name: CString) -> VFuncInfo
}
