class Target < ISM::Software
    
    def configure
        super

        configureSource(arguments:  "--prefix=/usr          \
                                    --sysconfdir=/etc       \
                                    --localstatedir=/var    \
                                    --disable-static        \
                                    --enable-kms-only       \
                                    --enable-uxa            \
                                    --mandir=/usr/share/man",
                        path:       buildDirectoryPath)
    end
    
    def build
        super

        makeSource(path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource( arguments:  "DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath} install",
                    path:       buildDirectoryPath)

        fileReplaceText(path:       "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/man/man1/intel-virtual-output.1",
                        text:       ".TH intel-virtual-output  4",
                        newText:    ".TH intel-virtual-output  1")
    end

end
