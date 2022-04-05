import Quagga from 'quagga';

const load_quagga = () => {
  const barcodeScanner = document.querySelector('#barcode-scanner');
  if (barcodeScanner) {
    if (Quagga.initialized == undefined) {
      Quagga.onDetected(function (result) {
        let code = result.codeResult.code;
        Quagga.stop();
        window.location.replace(`/products/${code}`)
      })
    }

    Quagga.init({
      inputStream: {
        name: "Live",
        type: "LiveStream",
        numOfWorkers: navigator.hardwareConcurrency,
        target: barcodeScanner
      },
      decoder: {
        readers: ['ean_reader']
      }
    }, function (err) {
      if (err) {
        console.log(err);
        return
      }
      Quagga.initialized = true;
      Quagga.start();
    });
  }
}

export { load_quagga }
