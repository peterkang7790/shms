package shms;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zefer.pd4ml.PD4ML;

import com.sun.net.ssl.HostnameVerifier;
import com.sun.net.ssl.HttpsURLConnection;
import com.sun.net.ssl.KeyManager;
import com.sun.net.ssl.SSLContext;
import com.sun.net.ssl.TrustManager;
import com.sun.net.ssl.X509TrustManager;

public class MakePdf extends HttpServlet{

		private static int ctr = 1; 
		
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

			SSLContext sslcontext = null;
			try {
				sslcontext = SSLContext.getInstance("TLS");
				sslcontext.init(new KeyManager[0], new TrustManager[] { new DummyTrustManager() },
						new SecureRandom());
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace(System.err);
			} catch (KeyManagementException e) {
				e.printStackTrace(System.err);
			}
			SSLSocketFactory factory = sslcontext.getSocketFactory();

			URL url = new URL("https://localhost:8443/test.jsp");
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
			connection.setSSLSocketFactory( factory );
			connection.setHostnameVerifier( new DummyHostnameVerifier() );

			PD4ML html = new PD4ML();
			html.setPageSize( new java.awt.Dimension(450, 450) );
			html.setPageInsets( new java.awt.Insets(20, 50, 10, 10) );
			html.setHtmlWidth( 750 );
			html.enableImgSplit( false );

			response.setContentType("application/pdf"); 
			response.setHeader("Content-disposition","inline; filename=test.pdf");
			if (!request.isSecure()) {
				response.setHeader("Pragma", "no-cache");
				response.setHeader("Expires", "-10000");
			}
			
			URL base = new URL( "file:C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\shms\\pd4ml\\index.jsp" );

			InputStreamReader isr = new InputStreamReader(connection.getInputStream());
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			html.render( isr, baos, base );

			byte[] result = baos.toByteArray();
			response.setContentLength(result.length);
			
			ServletOutputStream sos = response.getOutputStream(); 
			sos.write( result );
		}

		public static class DummyTrustManager implements X509TrustManager {

			public DummyTrustManager() {
			}

			public boolean isClientTrusted(X509Certificate cert[]) {
				return true;
			}

			public boolean isServerTrusted(X509Certificate cert[]) {
				return true;
			}

			public X509Certificate[] getAcceptedIssuers() {
				return new X509Certificate[0];
			}

			public void checkClientTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
				
			}

			public void checkServerTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
				
			}
		}

		public static class DummyHostnameVerifier implements HostnameVerifier {
			
			public boolean verify( String urlHostname, String certHostname ) {
				return true;
			}

			public boolean verify(String arg0, SSLSession arg1) {
				return true;
			}
		}
	}

