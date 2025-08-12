vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO cieslarmichal/config-cxx
    REF 80d25793c278b90719a13cd9cc6c28a5e0202d77
    SHA512 83e311951d26b46d7a98cda52649a927425203b8a4a5dcff75794d10e9c852b26464218c579a953d4b2ee92afbda5e474990aeaa758d0d2b93dfdac806ec43e6
    HEAD_REF master
    PATCHES
    config-cxx_vcpkg.patch
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/config-cxx)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
