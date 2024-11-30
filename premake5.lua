project "nvrhi"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/nvrhi/nvrhi.h",
        "include/nvrhi/utils.h",
        "include/nvrhi/common/containers.h",
        "include/nvrhi/common/misc.h",
        "include/nvrhi/common/resource.h",
        "include/nvrhi/common/aftermath.h",

        "src/common/format-info.cpp",
        "src/common/misc.cpp",
        "src/common/state-tracking.cpp",
        "src/common/state-tracking.h",
        "src/common/utils.cpp",
        "src/common/aftermath.cpp",

        "include/nvrhi/validation.h",
        "src/validation/validation-commandlist.cpp",
        "src/validation/validation-device.cpp",
        "src/validation/validation-backend.h",
        "src/common/sparse-bitset.h",
        "src/common/sparse-bitset.cpp",
    }

    includedirs {
        "include",
        "rtxmu/include"
    }

    defines {
        "_ITERATOR_DEBUG_LEVEL=1",
        "NVRHI_WITH_RTXMU=1",
        "NOMINMAX"
    }

    links {
        "nvrhi-vulkan",
    }

    filter "system:windows"
        systemversion "latest"

        files {
            "tools/nvrhi.natvis"
        }

        defines {
            "nvrhi-d3d11",
            "nvrhi-d3d12"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"

project "nvrhi-vulkan"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/nvrhi/nvrhi.h",

        "src/common/versioning.h",
        "src/vulkan/vulkan-allocator.cpp",
        "src/vulkan/vulkan-buffer.cpp",
        "src/vulkan/vulkan-commandlist.cpp",
        "src/vulkan/vulkan-compute.cpp",
        "src/vulkan/vulkan-constants.cpp",
        "src/vulkan/vulkan-device.cpp",
        "src/vulkan/vulkan-graphics.cpp",
        "src/vulkan/vulkan-meshlets.cpp",
        "src/vulkan/vulkan-queries.cpp",
        "src/vulkan/vulkan-queue.cpp",
        "src/vulkan/vulkan-raytracing.cpp",
        "src/vulkan/vulkan-resource-bindings.cpp",
        "src/vulkan/vulkan-shader.cpp",
        "src/vulkan/vulkan-staging-texture.cpp",
        "src/vulkan/vulkan-state-tracking.cpp",
        "src/vulkan/vulkan-texture.cpp",
        "src/vulkan/vulkan-upload.cpp",
        "src/vulkan/vulkan-backend.h",
        
        "rtxmu/src/VkAccelStructManager.cpp",
        "rtxmu/src/VulkanSuballocator.cpp",
    }

    VULKAN_SDK = os.getenv("VULKAN_SDK")

    includedirs {
        "include",
        "rtxmu/include",
        "%{VULKAN_SDK}/Include"
    }

    defines {
        "_ITERATOR_DEBUG_LEVEL=1",
        "NVRHI_WITH_RTXMU=1",
        "NOMINMAX"
    }

    filter "system:windows"
        defines {
            "VK_USE_PLATFORM_WIN32_KHR"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"

if os.host() == "windows" then
project "nvrhi-d3d11"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/common/dxgi-format.h",
        "src/common/dxgi-format.cpp",
        "src/d3d11/d3d11-buffer.cpp",
        "src/d3d11/d3d11-commandlist.cpp",
        "src/d3d11/d3d11-compute.cpp",
        "src/d3d11/d3d11-constants.cpp",
        "src/d3d11/d3d11-backend.h",
        "src/d3d11/d3d11-device.cpp",
        "src/d3d11/d3d11-graphics.cpp",
        "src/d3d11/d3d11-queries.cpp",
        "src/d3d11/d3d11-resource-bindings.cpp",
        "src/d3d11/d3d11-shader.cpp",
        "src/d3d11/d3d11-texture.cpp"
    }

    includedirs {
        "include",
        "rtxmu/include"
    }

    defines {
        "_ITERATOR_DEBUG_LEVEL=1",
        "NVRHI_WITH_RTXMU=1",
        "NOMINMAX"
    }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"

project "nvrhi-d3d12"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/common/dxgi-format.h",
        "src/common/dxgi-format.cpp",
        "src/common/versioning.h",
        "src/d3d12/d3d12-buffer.cpp",
        "src/d3d12/d3d12-commandlist.cpp",
        "src/d3d12/d3d12-compute.cpp",
        "src/d3d12/d3d12-constants.cpp",
        "src/d3d12/d3d12-backend.h",
        "src/d3d12/d3d12-descriptor-heap.cpp",
        "src/d3d12/d3d12-device.cpp",
        "src/d3d12/d3d12-graphics.cpp",
        "src/d3d12/d3d12-meshlets.cpp",
        "src/d3d12/d3d12-queries.cpp",
        "src/d3d12/d3d12-raytracing.cpp",
        "src/d3d12/d3d12-resource-bindings.cpp",
        "src/d3d12/d3d12-shader.cpp",
        "src/d3d12/d3d12-state-tracking.cpp",
        "src/d3d12/d3d12-texture.cpp",
        "src/d3d12/d3d12-upload.cpp",
        "rtxmu/src/D3D12AccelStructManager.cpp",
        "rtxmu/src/D3D12Suballocator.cpp"
    }

    includedirs {
        "include",
        "rtxmu/include"
    }

    defines {
        "_ITERATOR_DEBUG_LEVEL=1",
        "NVRHI_WITH_RTXMU=1",
        "NOMINMAX"
    }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
end