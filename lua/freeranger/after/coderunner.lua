local coderunner = require("code_runner")

coderunner.setup({
    filetype = {
        python = "python -u",
        cpp = {
            "cd $dir &&",
            "g++ $fileName -o $fileNameWithoutExt.exe &&",
            "$dir/$fileNameWithoutExt.exe"
        },
        c = {
            "cd $dir &&",
            "gcc $fileName -o $fileNameWithoutExt.exe &&",
            "$dir/$fileNameWithoutExt.exe"
        },
    },
    mode = "toggleterm",
})
