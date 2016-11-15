#!\bin\bash

# Start for galileo-3
if [ $galileo = "true" ]
then 
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    # HIDAPI
    sudo -H -u sspwr bash -c 'make -C build hidapi.distclean'
    sudo -H -u sspwr bash -c 'make -C build hidapi'
    
    # Check if galileo exists in Local RPM exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3  
    fi
    
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/hidapi" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/hidapi  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/hidapi/hidapi-${RELEASE_VERSION}-$BUILD_NUMBER
    
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/hidapi*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/hidapi/hidapi-${RELEASE_VERSION}-$BUILD_NUMBER
   	
    cd ${LOCAL_RPMS}/RPMS/galileo-3/hidapi/hidapi-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} hidapi-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} hidapi-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} hidapi-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
    # Check if galileo-3 exist or not
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3  
    fi
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/hidapi" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/hidapi  
    fi
    
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/hidapi/hidapi-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cp ${LOCAL_RPMS}/RPMS/galileo-3/hidapi/hidapi-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/hidapi/hidapi-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n################"
    printf "\n End of hidapi\n"
    printf "################\n\n"
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    # Ingenicotranslationlibrary
    sudo -H -u sspwr bash -c 'make -C build ingenicotranslationlibrary.distclean'
    sudo -H -u sspwr bash -c 'make -C build ingenicotranslationlibrary'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/ingenicotranslationlibrary" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/ingenicotranslationlibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/ingenicotranslationlibrary/ingenicotranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/ingenicotranslationlibrary*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/ingenicotranslationlibrary/ingenicotranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
 
    cd ${LOCAL_RPMS}/RPMS/galileo-3/ingenicotranslationlibrary/ingenicotranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} ingenicotranslationlibrary-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} ingenicotranslationlibrary-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} ingenicotranslationlibrary-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/ingenicotranslationlibrary" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/ingenicotranslationlibrary  
    fi
    
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/ingenicotranslationlibrary/ingenicotranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/ingenicotranslationlibrary/ingenicotranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/ingenicotranslationlibrary/ingenicotranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n####################################"
    printf "\n End of ingenicotranslationlibrary\n"
    printf "####################################\n\n"
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    
    # Kiosk3Library
    sudo -H -u sspwr bash -c 'make -C build Kiosk3Library.distclean'
    sudo -H -u sspwr bash -c 'make -C build Kiosk3Library'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3Library" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3Library  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3Library/Kiosk3Library-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/Kiosk3Library*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3Library/Kiosk3Library-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3Library/Kiosk3Library-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} Kiosk3Library-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} Kiosk3Library-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} Kiosk3Library-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/Kiosk3Library" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/Kiosk3Library  
    fi
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/Kiosk3Library/Kiosk3Library-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3Library/Kiosk3Library-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/Kiosk3Library/Kiosk3Library-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n####################"
    printf "\n End of Kiosk3Library\n"
    printf "####################\n\n"
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    
    # Kiosk3TranslationLibrary
    sudo -H -u sspwr bash -c 'make -C build Kiosk3TranslationLibrary.distclean'
    sudo -H -u sspwr bash -c 'make -C build Kiosk3TranslationLibrary'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3TranslationLibrary" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3TranslationLibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3TranslationLibrary/Kiosk3TranslationLibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/Kiosk3TranslationLibrary*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3TranslationLibrary/Kiosk3TranslationLibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3TranslationLibrary/Kiosk3TranslationLibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} Kiosk3TranslationLibrary-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} Kiosk3TranslationLibrary-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} Kiosk3TranslationLibrary-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/Kiosk3TranslationLibrary" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/Kiosk3TranslationLibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/Kiosk3TranslationLibrary/Kiosk3TranslationLibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cp ${LOCAL_RPMS}/RPMS/galileo-3/Kiosk3TranslationLibrary/Kiosk3TranslationLibrary-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/Kiosk3TranslationLibrary/Kiosk3TranslationLibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n###################################"
    printf "\n End of Kiosk3TranslationLibrary\n"
    printf "###################################\n\n"
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    
    # llapi
    sudo -H -u sspwr bash -c 'make -C build llapi.distclean'
    sudo -H -u sspwr bash -c 'make -C build llapi'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/llapi" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/llapi  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/llapi/llapi-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/llapi-*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/llapi/llapi-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/llapi/llapi-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} llapi-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} llapi-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} llapi-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
   
   
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/llapi" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/llapi  
    fi
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/llapi/llapi-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/llapi/llapi-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/llapi/llapi-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n####################"
    printf "\n End of llapi\n"
    printf "####################\n\n"
    
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    # nritranslationlibrary
    sudo -H -u sspwr bash -c 'make -C build nritranslationlibrary.distclean'
    sudo -H -u sspwr bash -c 'make -C build nritranslationlibrary'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/nritranslationlibrary" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/nritranslationlibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/nritranslationlibrary/nritranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/nritranslationlibrary*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/nritranslationlibrary/nritranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/nritranslationlibrary/nritranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} nritranslationlibrary-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} nritranslationlibrary-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} nritranslationlibrary-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/nritranslationlibrary" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/nritranslationlibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/nritranslationlibrary/nritranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/nritranslationlibrary/nritranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/nritranslationlibrary/nritranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n##############################"
    printf "\n End of nritranslationlibrary\n"
    printf "##############################\n\n"
    
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    # nv9translationlibrary
    sudo -H -u sspwr bash -c 'make -C build nv9translationlibrary.distclean'
    sudo -H -u sspwr bash -c 'make -C build nv9translationlibrary'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/nv9translationlibrary" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/nv9translationlibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/nv9translationlibrary/nv9translationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/nv9translationlibrary*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/nv9translationlibrary/nv9translationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/nv9translationlibrary/nv9translationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} nv9translationlibrary-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} nv9translationlibrary-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} nv9translationlibrary-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/nv9translationlibrary" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/nv9translationlibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/nv9translationlibrary/nv9translationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/nv9translationlibrary/nv9translationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/nv9translationlibrary/nv9translationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n##############################"
    printf "\n End of nritranslationlibrary\n"
    printf "##############################\n\n"
    
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    
    # secureheadmsrlibrary
    sudo -H -u sspwr bash -c 'make -C build secureheadmsrlibrary.distclean'
    sudo -H -u sspwr bash -c 'make -C build secureheadmsrlibrary'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/secureheadmsrlibrary" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/secureheadmsrlibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/secureheadmsrlibrary/secureheadmsrlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/secureheadmsrlibrary*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/secureheadmsrlibrary/secureheadmsrlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/secureheadmsrlibrary/secureheadmsrlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} secureheadmsrlibrary-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} secureheadmsrlibrary-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} secureheadmsrlibrary-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/secureheadmsrlibrary" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/secureheadmsrlibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/secureheadmsrlibrary/secureheadmsrlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/secureheadmsrlibrary/secureheadmsrlibrary-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/secureheadmsrlibrary/secureheadmsrlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n##############################"
    printf "\n End of secureheadmsrlibrary\n"
    printf "##############################\n\n"
    
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    
    # secureheadtranslationlibrary
    sudo -H -u sspwr bash -c 'make -C build secureheadtranslationlibrary.distclean'
    sudo -H -u sspwr bash -c 'make -C build secureheadtranslationlibrary'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/secureheadtranslationlibrary" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/secureheadtranslationlibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/secureheadtranslationlibrary/secureheadtranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/secureheadtranslationlibrary*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/secureheadtranslationlibrary/secureheadtranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/secureheadtranslationlibrary/secureheadtranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} secureheadtranslationlibrary-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} secureheadtranslationlibrary-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} secureheadtranslationlibrary-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
   
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/secureheadtranslationlibrary" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/secureheadtranslationlibrary  
    fi
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/secureheadtranslationlibrary/secureheadtranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/secureheadtranslationlibrary/secureheadtranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/secureheadtranslationlibrary/secureheadtranslationlibrary-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n####################################"
    printf "\n End of secureheadtranslationlibrary\n"
    printf "####################################\n\n"
    
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    
    # HLAPI
    sudo -H -u sspwr bash -c 'make -C build hlapi.distclean'
    sudo -H -u sspwr bash -c 'make -C build hlapi'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/hlapi" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/hlapi  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/hlapi/hlapi-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/hlapi-*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/hlapi/hlapi-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/hlapi/hlapi-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} hlapi-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} hlapi-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} hlapi-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/hlapi" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/hlapi  
    fi
    
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/hlapi/hlapi-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/hlapi/hlapi-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/hlapi/hlapi-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n##################"
    printf "\n End of hlapi\n"
    printf "##################\n\n"
    
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    
    # hlapitestapp
    sudo -H -u sspwr bash -c 'make -C build hlapitestapp.distclean'
    sudo -H -u sspwr bash -c 'make -C build hlapitestapp'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/hlapitestapp" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/hlapitestapp  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/hlapitestapp/hlapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/hlapitestapp*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/hlapitestapp/hlapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/hlapitestapp/hlapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} hlapitestapp-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} hlapitestapp-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} hlapitestapp-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
    
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/hlapitestapp" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/hlapitestapp  
    fi
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/hlapitestapp/hlapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/hlapitestapp/hlapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/hlapitestapp/hlapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n#####################"
    printf "\n End of hlapitestapp\n"
    aprintf "#####################\n\n"
    
    
    cd "/media/sspwr/wrbuildsata3/Project/SunsetPass/galileo-3"
    
    
    # llapitestapp
    sudo -H -u sspwr bash -c 'make -C build llapitestapp.distclean'
    sudo -H -u sspwr bash -c 'make -C build llapitestapp'
    
    # Check if Directory exists or not
    if [ ! -d "${LOCAL_RPMS}/RPMS/galileo-3/llapitestapp" ]; then
        mkdir ${LOCAL_RPMS}/RPMS/galileo-3/llapitestapp  
    fi
    
    mkdir ${LOCAL_RPMS}/RPMS/galileo-3/llapitestapp/llapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    
    # Copy some RPM files into the RPM workspace
    cp ${GALILEO_RPMS}/llapitestapp*.rpm ${LOCAL_RPMS}/RPMS/galileo-3/llapitestapp/llapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    
    cd ${LOCAL_RPMS}/RPMS/galileo-3/llapitestapp/llapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    rpm_dir=(*.rpm)
    mv ${rpm_dir[0]} llapitestapp-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[1]} llapitestapp-dbg-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    mv ${rpm_dir[2]} llapitestapp-dev-${RELEASE_VERSION}-${RPM_VERSION}.$BUILD_NUMBER.quark.rpm
    cd -
   
    if [ ! -d "${LOCAL_RPMS}/BUILD/galileo-3/llapitestapp" ]; then
        mkdir ${LOCAL_RPMS}/BUILD/galileo-3/llapitestapp  
    fi
    
    mkdir ${LOCAL_RPMS}/BUILD/galileo-3/llapitestapp/llapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    cp ${LOCAL_RPMS}/RPMS/galileo-3/llapitestapp/llapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER/* ${LOCAL_RPMS}/BUILD/galileo-3/llapitestapp/llapitestapp-${RELEASE_VERSION}-$BUILD_NUMBER
    
    printf "\n\n#####################"
    printf "\n End of llapitestapp\n"
    printf "#####################\n\n"
fi





