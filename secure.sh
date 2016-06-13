
javac -version 
if [ $? -ne 0 ];then
   echo "+-----------------------------------------------------------------------+"
   echo "|PLEASE ENSURE THAT **JAVAC** IS THERE IN YOUR SYSTEM. AND PATH IS SET. |"
   echo "+-----------------------------------------------------------------------+"
   exit 1
else
   echo "+---------+"
   echo "|JAVAC OK!|"
   echo "+---------+"
fi

java -version 
if [ $? -ne 0 ];then
   echo "+----------------------------------------------------------------------+"
   echo "|PLEASE ENSURE THAT **JAVA** IS THERE IN YOUR SYSTEM. AND PATH IS SET. |"
   echo "+----------------------------------------------------------------------+"
   exit 1
else
   echo "+--------+"
   echo "|JAVA OK!|"
   echo "+--------+"
fi

if [ "$1" = "-e" -a -d $2 ];then
	pw=$PWD
	cd $2
	IFS=""
	for i in *;do
		zip -r DATA $i
		rm -r $i
	done
	cd $pw
	echo "import java.io.*;

class Security {
   public static void main(String args[]) throws IOException
   {
      FileInputStream in = null;
      FileOutputStream out = null;
	 String key = args[1];
	 int j=0;
      try {
         in = new FileInputStream(args[0]);
         out = new FileOutputStream(\"ENCRYPTED\");
         
         int c;
         while ((c = in.read()) != -1) {
            out.write(c+Integer.parseInt(\"\"+key.charAt(j++)));
            if (j==key.length())
            	j=0;
         }
      }finally {
         if (in != null) {
            in.close();
         }
         if (out != null) {
            out.close();
         }
      }
   }
}" > Security.java
javac Security.java
	echo "Please Wait.."
	java Security $2/DATA.zip $3
	mv ./ENCRYPTED $2
	rm -r Security.java
	rm -r Security.class
	rm -r $2/DATA.zip
	echo "Encryption done"
elif [ "$1" = "-d" -a -d $2 ];then
	echo "import java.io.*;

class Security {
   public static void main(String args[]) throws IOException
   {
      FileInputStream in = null;
      FileOutputStream out = null;
	 String key = args[1];
	 int j=0;
      try {
         in = new FileInputStream(args[0]);
         out = new FileOutputStream(\"DATA.zip\");
         
         int c;
         while ((c = in.read()) != -1) {
            out.write(c-Integer.parseInt(\"\"+key.charAt(j++)));
            if (j==key.length())
            	j=0;
         }
      }finally {
         if (in != null) {
            in.close();
         }
         if (out != null) {
            out.close();
         }
      }
   }
}" > Security.java
	javac Security.java
	echo "Please Wait"
	java Security $2/ENCRYPTED $3
	mv ./DATA.zip $2
	rm -r Security.java
	rm -r Security.class
	rm -r $2/ENCRYPTED
	cd $2
	unzip DATA.zip
	rm -r DATA.zip
	echo "Decryption Done"
else
	echo "+--------------------------------------+"
	echo "|Secyrity Enhancement tool v1.1        |"
	echo "+--------------------------------------+"
	echo "|First argument                        |"
	echo "|-e for Encryption OR -d for Decryption|"
	echo "+--------------------------------------+"
	echo "|Second argument PATH to the directory |"
	echo "+--------------------------------------+"
	echo "|Third argument THE KEY (eg. 432413435)|"
	echo "+--------------------------------------+"
fi
