use gi
import gi/[FunctionInfo, VFuncInfo, RegisteredTypeInfo, ConstantInfo, StructInfo, SignalInfo, InterfaceInfo, FieldInfo, PropertyInfo]

ObjectInfo: cover from GIObjectInfo* extends RegisteredTypeInfo {
    getTypeName: extern(g_object_info_get_type_name) func -> CString
    getTypeInit: extern(g_object_info_get_type_init) func -> CString
    getAbstract?: extern(g_object_info_get_abstract) func -> Bool
    getFundamental?: extern(g_object_info_get_fundamental) func -> Bool
    getParent: extern(g_object_info_get_parent) func -> This
    getNInterfaces: extern(g_object_info_get_n_interfaces) func -> Int
    getInterface: extern(g_object_info_get_interface) func(n: Int) -> InterfaceInfo
    getNFields: extern(g_object_info_get_n_fields) func -> Int
    getField: extern(g_object_info_get_field) func(n: Int) -> FieldInfo
    getNProperties: extern(g_object_info_get_n_properties) func -> Int
    getProperty: extern(g_object_info_get_property) func(n: Int) -> PropertyInfo
    getNMethods: extern(g_object_info_get_n_methods) func -> Int
    getMethod: extern(g_object_info_get_method) func(n: Int) -> FunctionInfo
    findMethod: extern(g_object_info_find_method) func(name: CString) -> FunctionInfo
    getNSignals: extern(g_object_info_get_n_signals) func -> Int
    getSignal: extern(g_object_info_get_signal) func(n: Int) -> SignalInfo
    getNVFuncs: extern(g_object_info_get_n_vfuncs) func -> Int
    getVFunc: extern(g_object_info_get_vfunc) func(n: Int) -> VFuncInfo
    getNConstants: extern(g_object_info_get_n_constants) func -> Int
    getConstant: extern(g_object_info_get_constant) func(n: Int) -> ConstantInfo
    getClassStruct: extern(g_object_info_get_class_struct) func -> StructInfo
    findVFunc: extern(g_object_info_find_vfuc) func(name: CString) -> VFuncInfo
    getUnrefFunction: extern(g_object_info_get_unref_function) func -> CString
    getRefFunction: extern(g_object_info_get_ref_function) func -> CString
    getSetValueFunction: extern(g_object_info_get_set_value_function) func -> CString
    getGetValueFunction: extern(g_object_info_get_get_value_function) func -> CString
}
