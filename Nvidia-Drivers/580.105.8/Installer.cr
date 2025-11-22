class Target < ISM::Software

    def build
        super

        makeSource( argument: "KERNEL_UNAME=#{mainKernelName}",
                    path: "#{mainWorkDirectoryPath}/#{option("Kernel-Open") ? "kernel-open" : "kernel"}")
    end

    def prepareInstallation
        super

        if !option("32Bits")
            deleteDirectory("#{mainWorkDirectoryPath}/usr/lib32")
        end

        if !option("Settings")
            deleteDirectory("#{mainWorkDirectoryPath}/usr/share/applications")
            deleteDirectory("#{mainWorkDirectoryPath}/usr/share/pixmaps")
        end

    end

end
