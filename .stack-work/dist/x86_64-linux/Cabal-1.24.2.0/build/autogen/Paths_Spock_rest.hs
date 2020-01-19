{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Spock_rest (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/data/src/Spock-rest/.stack-work/install/x86_64-linux/1bbfd76eef9022a7f5181c5655c156d3080c3e72ef20cfd641c14eefdf559e83/8.0.2/bin"
libdir     = "/data/src/Spock-rest/.stack-work/install/x86_64-linux/1bbfd76eef9022a7f5181c5655c156d3080c3e72ef20cfd641c14eefdf559e83/8.0.2/lib/x86_64-linux-ghc-8.0.2/Spock-rest-0.1.0.0-B4n8gHIF4sWHSYLK5s4qRd"
dynlibdir  = "/data/src/Spock-rest/.stack-work/install/x86_64-linux/1bbfd76eef9022a7f5181c5655c156d3080c3e72ef20cfd641c14eefdf559e83/8.0.2/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/data/src/Spock-rest/.stack-work/install/x86_64-linux/1bbfd76eef9022a7f5181c5655c156d3080c3e72ef20cfd641c14eefdf559e83/8.0.2/share/x86_64-linux-ghc-8.0.2/Spock-rest-0.1.0.0"
libexecdir = "/data/src/Spock-rest/.stack-work/install/x86_64-linux/1bbfd76eef9022a7f5181c5655c156d3080c3e72ef20cfd641c14eefdf559e83/8.0.2/libexec"
sysconfdir = "/data/src/Spock-rest/.stack-work/install/x86_64-linux/1bbfd76eef9022a7f5181c5655c156d3080c3e72ef20cfd641c14eefdf559e83/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Spock_rest_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Spock_rest_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Spock_rest_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Spock_rest_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Spock_rest_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Spock_rest_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
