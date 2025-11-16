class Target < ISM::PackagedSoftware

    def prepareInstallation
        if !option("32Bits")
            deleteDirectory("#{mainWorkDirectoryPath}/usr/lib32")
        end

        if !option("Settings")
            deleteDirectory("#{mainWorkDirectoryPath}/usr/share/applications")
            deleteDirectory("#{mainWorkDirectoryPath}/usr/share/pixmaps")
        end

        super
    end

end
