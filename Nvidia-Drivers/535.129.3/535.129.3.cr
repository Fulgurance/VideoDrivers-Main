class Target < ISM::Software
    
    def prepareInstallation
        super

        ["etc","lib","usr"].each do |directory|
            moveFile("#{buildDirectoryPath(false)}#{directory}","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}#{directory}")
        end

        if option("Openrc")
            prepareOpenrcServiceInstallation("#{workDirectoryPath(false)}/Nvidia-Persistenced-Init.d","nvidia-persistenced")
        end

        if !option("Nvidia-Settings")
            deleteFile("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/bin/nvidia-settings")
            deleteFile("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/applications/nvidia-settings.desktop")
            deleteFile("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/pixmaps/nvidia-settings.png")
        end

    end

end
