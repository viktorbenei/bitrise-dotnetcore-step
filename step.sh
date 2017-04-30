echo "Installing .NET core"
echo "--------------------"
echo ""
echo "Install pre-requisites"
echo ""
brew update
brew install openssl
mkdir -p /usr/local/lib
ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/
echo ""
echo "Install .NET Core SDK"
echo ""
wget https://raw.githubusercontent.com/dotnet/cli/master/scripts/obtain/dotnet-install.sh
chmod +x dotnet-install.sh
if [ -n "${channel}" ] && [ -n "${version}" ]
  then
    echo "Installing channel: ${channel} and version: ${version}"
    ./dotnet-install.sh  --channel "${channel}" --version "${version}"
elif [ -n "${channel}" ]
  then
    echo "Installing channel: ${channel}"
    ./dotnet-install.sh  --channel "${channel}"
elif [ -n "${version}" ]
  then
    echo "Installing version: ${version}"
    ./dotnet-install.sh  --version "${version}"
fi
export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
echo ""
echo "Fixing some environment variables"
echo ""
ln -s /Users/vagrant/.dotnet/dotnet /usr/local/bin/dotnet
echo ""
echo "Installed .NET Core version"
echo ""
dotnet --version