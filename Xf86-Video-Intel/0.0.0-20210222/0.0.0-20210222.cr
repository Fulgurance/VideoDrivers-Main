class Target < ISM::Software
    
    def configure
        super

        configureSource([   "--prefix=/usr",
                            "--sysconfdir=/etc",
                            "--localstatedir=/var",
                            "--disable-static",
                            "--enable-kms-only",
                            "--enable-uxa",
                            "--mandir=/usr/share/man"],
                            buildDirectoryPath)
    end
    
    def build
        super

        makeSource(path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource(["DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}","install"],buildDirectoryPath)

        fileReplaceText("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/man/man1/intel-virtual-output.1",".TH intel-virtual-output  4",".TH intel-virtual-output  1")
    end

end
