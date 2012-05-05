use gi, gtk
import gi/BaseInfo
import gtk/[_GObject, Gtk]

RepositoryError: extern(GIRepositoryError) enum {
    typeLibNotFound: extern(G_IREPOSITORY_ERROR_TYPELIB_NOT_FOUND),
    namespaceMismatch: extern(G_IREPOSITORY_ERROR_NAMESPACE_MISMATCH),
    namespaceVersionConflict: extern(G_IREPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT),
    libraryNotFound: extern(G_IREPOSITORY_ERROR_LIBRARY_NOT_FOUND)
}

RepositoryLoadFlags: extern(GIRepositoryLoadFlags) enum {
    lazy: extern(G_IREPOSITORY_LOAD_FLAG_LAZY)
}

Repository: cover from GIRepository* extends _GObject {
    getDefault: static extern(g_irepository_get_default) func -> This
    prependSearchPath: static extern(g_irepository_prepend_search_path) func(directory: CString)
    //getSearchPath: static extern(g_irepository_get_search_path) func -> GSList
    
    loadTypeLib: extern(g_irepository_load_typelib) func(typelib: TypeLib, flags: RepositoryLoadFlags, error: GError**) -> CString
    registered?: extern(g_irepository_is_registered) func(namespace, version: CString) -> Bool
    findByName: extern(g_irepository_find_by_name) func(namespace, version: CString) -> BaseInfo
    require: extern(g_irepository_require) func(namespace, version: CString, flags: RepositoryLoadFlags, error: GError**) -> TypeLib
    requirePrivate: extern(g_irepository_require_private) func(typeLibDir, namespace, version: CString, flags: RepositoryLoadFlags, error: GError**) -> TypeLib
    getDependecies: extern(g_irepository_get_dependencies) func(namespace: CString) -> CString[]
    getLoadedNamespaces: extern(g_irepository_get_loaded_namespaces) func -> CString[]
    //findByGType: extern(g_irepository_find_by_gtype) func(gtype: GType) -> BaseInfo
    getNInfos: extern(g_irepository_get_n_infos) func(namespace: CString) -> Int
    getInfo: extern(g_irepository_get_info) func(namespace: CString, index: Int) -> BaseInfo

    getTypeLibPath: extern(g_irepository_get_typelib_path) func(namespace: CString) -> CString
    getSharedLibrary: extern(g_irepository_get_shared_library) func(namespace: CString) -> CString
    getVersion: extern(g_irepository_get_version) func(namespace: CString) -> CString
    //getOptionGroup: static extern(g_irepository_get_option_group) func -> OptionGroup
    getCPrefix: extern(g_irepository_get_c_prefix) func(namespace: CString) -> CString
    dump: static extern(g_irepository_dump) func(arg: CString, error: GError*) -> Bool
    //enumerateVersions: extern(g_irepository_enumerate_versions) func(namespace: CString) -> GList
    error: static extern(G_IREPOSITORY_ERROR) func -> Quark
}

TypeLib: cover from GITypeLib* {
    new: static extern(g_typelib_new_from_memory) func~fromMemory(memory: UInt8*, len: UInt, error: GError**) -> This
    new: static extern(g_typelib_new_from_const_memory) func~fromConstMemory(memory: const UInt8*, len: UInt, error: GError**) -> This
    //new: static extern(g_typelib_new_from_mapped_file) func~fromMappedFile(mfile: MappedFile, error: GError*) -> This
    free: extern(g_typelib_free) func
    symbol: extern(g_typelib_symbol) func~pointer(name: CString, _symbol: Pointer) -> Bool
    symbol: func~returnsTuple(name: CString) -> (Pointer, Bool) {
        _symbol: Pointer
        ret := symbol~pointer(name, _symbol)
        (_symbol, ret)
    }
    getNamespace: extern(g_typelib_get_namespace) func -> CString
}

