package ar.com.intrale.mobile;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import androidx.annotation.Nullable;

import java.util.HashMap;

//import io.flutter.embedding.android.FlutterActivity;
import io.flutter.FlutterInjector;
import io.flutter.app.FlutterApplication;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

import com.mercadopago.android.px.core.MercadoPagoCheckout;

public class IntraleApplication extends FlutterApplication  {

    public static final String MERCADO_PAGO_CHANNEL = "intrale.com/mercado_pago";
    public static final int MERCADO_PAGO_REQUEST_CODE = 11;
    public static final String MERCADO_PAGO_START_PAYMENT_METHOD = "startPayment";
    public static final String MERCADO_PAGO_PUBLIC_KEY_ARG = "publicKey";
    public static final String MERCADO_PAGO_PREFERENCE_ID_ARG = "preferenceId";

@Override
    public void onCreate() {
        super.onCreate();
        /*try {

            DartExecutor dartExecutor = (DartExecutor) this.getMainExecutor();

            System.err.println("Inicializando MainActivity");
            new MethodChannel(dartExecutor.getBinaryMessenger(), MERCADO_PAGO_CHANNEL).setMethodCallHandler(
                    new MethodCallHandler() {
                        @Override
                        public void onMethodCall(MethodCall call, Result result) {
                            System.out.println("Ejecutando llamada a metodo desde flutter");
                            if (call.method.equals(MERCADO_PAGO_START_PAYMENT_METHOD)) {
                                startPayment(call, result);
                            } else {
                                result.notImplemented(); // INFO: not implemented
                            }
                        }
                    }
            );
            System.err.println("Se genero el canal en MainActivity");
        } catch (Exception e){
            System.err.println("Ocurrio un error:" + e.getMessage());
            e.printStackTrace();
        }*/
    }

   /* @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        System.out.println("Inicializando MainActivity");

        new MethodChannel(getFlutterView(), MERCADO_PAGO_CHANNEL).setMethodCallHandler(
                new MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, Result result) {
                        System.out.println("Ejecutando llamada a metodo desde flutter");
                        if (call.method.equals(MERCADO_PAGO_START_PAYMENT_METHOD)) {
                            startPayment(call, result);
                        }
                        else {
                            result.notImplemented(); // INFO: not implemented
                        }
                    }
                }
        );
        System.out.println("Se genero el canal en MainActivity");


    }*/
   /*MethodChannel methodChannel = new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(),
                "intrale.com/mercadoPago");

        methodChannel.setMethodCallHandler((call, result) -> {
            HashMap<String, Object> arguments = (HashMap<String, Object>) call.arguments;
            String publicKey = (String) arguments.get("publicKey");
            String preferenceId = (String) arguments.get("preferenceId");

            new MercadoPagoCheckout.Builder(publicKey, preferenceId)
                    .build().startPayment(MainActivity.this, MERCADO_PAGO_REQUEST_CODE);


        });*/

    /*private void startPayment(MethodCall call, Result result) {
        HashMap<String, Object> arguments = (HashMap<String, Object>) call.arguments;
        String publicKey = (String) arguments.get(MERCADO_PAGO_PUBLIC_KEY_ARG);
        String preferenceId = (String) arguments.get(MERCADO_PAGO_PREFERENCE_ID_ARG);

        new MercadoPagoCheckout.Builder(publicKey, preferenceId)
                .build().startPayment(IntraleApplication.this, MERCADO_PAGO_REQUEST_CODE);
    }*/
}
