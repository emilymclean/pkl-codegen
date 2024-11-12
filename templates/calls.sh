LD_LIBRARY_PATH=/usr/share/swift/usr/lib/swift/linux PATH=$PATH:/usr/share/swift/usr/bin/ /pkl-gen-swift
java -cp /pklgen.jar org.pkl.codegen.kotlin.Main
java -cp /pklgen.jar org.pkl.codegen.java.Main
java -cp /pklgen.jar org.pkl.doc.Main
echo