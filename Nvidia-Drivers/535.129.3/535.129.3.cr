class Target < ISM::Software
    
    def prepareInstallation
        super

        ["etc","lib","usr"].each do |directory|
            moveFile("#{buildDirectoryPath}#{directory}","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}#{directory}")
        end

        if option("Openrc")
            prepareOpenrcServiceInstallation("#{workDirectoryPath}/Nvidia-Persistenced-Init.d","nvidia-persistenced")
        end

        if !option("Nvidia-Settings")
            deleteFile("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/bin/nvidia-settings")
            deleteFile("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/applications/nvidia-settings.desktop")
            deleteFile("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/pixmaps/nvidia-settings.png")
        end

    end

end
