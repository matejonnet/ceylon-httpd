import java.lang { Integer }
import java.io { File }
import java.net { InetSocketAddress }
import org.xnio { 
	Xnio { xnioInstance = instance }, 
	XnioWorker, 
	OptionMap { omBuilder = builder }, 
	Options { 
		workerWriteThreads = \iWORKER_WRITE_THREADS, 
		workerReadThreads = \iWORKER_READ_THREADS, 
		connectionLowWatter = \iCONNECTION_LOW_WATER, 
		connectionHighWatter = \iCONNECTION_HIGH_WATER,
		workerTaskCoreThreads = \iWORKER_TASK_CORE_THREADS,
		workerTaskMaxThreads = \iWORKER_TASK_MAX_THREADS,
		tcpNoDelay = \iTCP_NODELAY
	}, 
	ByteBufferSlicePool, 
	BufferAllocator {directByteBufferAllocator  = \iDIRECT_BYTE_BUFFER_ALLOCATOR}, 
	ChannelListener
}
import org.xnio.channels { AcceptingChannel, ConnectedStreamChannel, ConnectedChannel }
import org.xnio.ceylonadapter {XnioWorkerHelper {createStreamServer}}
import io.undertow.server { HttpOpenListener, HttpTransferEncodingHandler, HttpHandler }
import io.undertow.server.handlers { CanonicalPathHandler }
import io.undertow.server.handlers.error { SimpleErrorPageHandler }
import io.undertow.server.handlers.file { FileHandler }

doc "Run the module `com.redhat.ceylon.sdk.net.httpd`."
void run() {
		
			
	//value port = 8080;
	value path = "/home/matej/temp/1__ulpload-test/lazydog2.txt";
   //value writeThreads = Integer(2);
	//value readThreads = Integer(2);
	//value workerThreads = Integer(4);
	
	//print("starting on port: " port "");
	//print ("serving path: " path "");
	//
	//OptionMap optionMap = omBuilder()
 //   		.set(workerWriteThreads, writeThreads)
	//		.set(workerReadThreads, readThreads)
	//		.set(connectionLowWatter, Integer(1000000))
	//		.set(connectionHighWatter, Integer(1000000))
	//		.set(workerTaskCoreThreads, workerThreads)
	//		.set(workerTaskMaxThreads, Integer(12))
	//		.set(tcpNoDelay, true)
	//		.map;
	
//	XnioWorker worker = xnioInstance.createWorker(optionMap);
//	HttpOpenListener openListener = HttpOpenListener(ByteBufferSlicePool(directByteBufferAllocator, 8192, 8192 * 8192));
	HttpHandler fileHandler = FileHandler(File(path));

	
	//HttpTransferEncodingHandler(CanonicalPathHandler(SimpleErrorPageHandler(fileHandler)));
	
	HttpHandler rootHandler = HttpTransferEncodingHandler(CanonicalPathHandler(SimpleErrorPageHandler(fileHandler)));
//	openListener.rootHandler := rootHandler;
//	
//	object channelListener satisfies ChannelListener<AcceptingChannel<ConnectedStreamChannel>> {
//		shared actual void handleEvent(AcceptingChannel<ConnectedStreamChannel>? channel) {
//			if (exists channel) {
//				ConnectedStreamChannel? accept = channel.accept();
//				if (exists accept) {
//					openListener.handleEvent(accept);
//				}		
//			}
//		}
//	}
//
//	AcceptingChannel<ConnectedChannel> acceptingChannel = createStreamServer(worker, InetSocketAddress(port), channelListener, optionMap);
//	acceptingChannel.resumeAccepts();
//	

}