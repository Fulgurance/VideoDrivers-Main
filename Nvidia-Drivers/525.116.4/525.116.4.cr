class Target < ISM::Software
    
    def prepareInstallation
        super

        ["etc","lib","usr"].each do |directory|
            moveFile("#{buildDirectoryPath(false)}#{directory}","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}#{directory}")
        end

        if option("Openrc")
            prepareOpenrcServiceInstallation("#{workDirectoryPath(false)}/Nvidia-Persistenced-Init.d","nvidia-persistenced")
        end

    end

end
