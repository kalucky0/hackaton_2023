const FtpDeploy = require("ftp-deploy");
const ftpDeploy = new FtpDeploy();

const config = {
    user: "ftp@app.kalucky0.dev",
    password: "mRdkP33Nm",
    host: "onolis.vxm.pl",
    port: 21,
    localRoot: __dirname + "/build",
    remoteRoot: "/",
    include: ["*", "**/*", ".htaccess"],
    exclude: [
        "node_modules/**",
        "node_modules/**/.*",
        ".git/**",
    ],
    deleteRemote: true,
    forcePasv: true,
    sftp: false,
};

ftpDeploy.on("uploading", function (data) {
    const percent = Math.round(
        (data.transferredFileCount / data.totalFilesCount) * 100
    );
    console.log(`[${percent}%] Uploading ${data.filename}`);
});

ftpDeploy
    .deploy(config)
    .then(() => console.log("Upload complete!"))
    .catch((err) => console.log(err));