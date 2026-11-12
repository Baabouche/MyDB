workspace "MyDB"
    configurations { "Debug", "Release" }
    location "build"

project "MyDB"
    kind "ConsoleApp"
    language "C"
    cdialect "C99"
    targetdir "build/bin/%{cfg.buildcfg}"
    objdir "build/obj/%{cfg.buildcfg}"

    files { 
      "src/**.c",
      "include/**.h",
    }

    includedirs {
      "include",
    }

    -- Compiler flags and preprocessor definitions
    filter "configurations:Debug"
        symbols "On"
        optimize "Off"
        defines { "DEBUG" }
        buildoptions { "-Wall", "-Wextra", "-Werror", "-fsanitize=address", "-g" }
        linkoptions { "-fsanitize=address" }

    filter "configurations:Release"
        symbols "Off"
        optimize "On"
        defines { "NDEBUG" }
        buildoptions { "-Wall", "-Wextra", "-Werror", "-fsanitize=address", "-O3" }
        linkoptions { "-fsanitize=address" }
