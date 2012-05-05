use gi
import gi/[BaseInfo, TypeInfo, ArgInfo]

CallableInfo: cover from GICallbleInfo* extends BaseInfo {
    getReturnType: extern(g_callable_info_get_return_type) func -> TypeInfo
    getCallerOwns: extern(g_callable_info_get_caller_owns) func -> Transfer
    mayReturnNull?: extern(g_callable_info_may_return_null) func -> Bool
    getReturnAttribute: extern(g_callable_info_get_return_attribute) func(name: CString) -> CString
    iterateReturnAttributes: extern(g_callable_info_iterate_return_attributes) func(iter: AttributeIter, name,value: CString*) -> Bool
    eachReturnAttribute: func(f: Func(CString, CString)) {
        name, value: CString
        iter := (null, null) as AttributeIter
        while(iterateReturnAttributes(iter&, name&, value&)) {
            f(name, value)
        }
    }
    getNArgs: extern(g_callable_info_get_n_args) func -> Int
    getArg: extern(g_callable_info_get_arg) func(n: Int) -> ArgInfo
    loadArg: extern(g_callable_info_load_arg) func(n: Int, arg: ArgInfo)
    loadReturnType: extern(g_callable_info_load_return_type) func(type: TypeInfo)
}
