use gi
import gi/BaseInfo

RegisteredTypeInfo: cover from GIRegisteredTypeInfo* extends BaseInfo {
    getTypeName: extern(g_registered_type_info_get_type_name) func -> CString
    getTypeInit: extern(g_registered_type_info_get_type_init) func -> CString
    //getGType: extern(g_registered_type_info_get_g_type) func -> GType
}
