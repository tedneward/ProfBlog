@ECHO ON

ECHO Baking...
call gradlew bake

ECHO Copying...
xcopy /s/e/y build\output\* D:\Dropbox\Apps\site44\blogs.newardassociates.com
