--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "*.html" $ do
        route idRoute
        compile $
            getResourceBody
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler
