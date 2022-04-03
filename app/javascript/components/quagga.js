import Quagga from 'quagga';

const load_quagga = () => {
  if (Quagga.initialized == undefined) {
    Quagga.onDetected(function (result) {
      let code = result.codeResult.code;
      Quagga.stop();
      console.log("Quagga stopped.")
      fetch(`/products/${code}`)
        .then(response => response.json())
        .then((data) => {
          console.log(data);
        });

    })
  }

  Quagga.init({
    inputStream: {
      name: "Live",
      type: "LiveStream",
      numOfWorkers: navigator.hardwareConcurrency,
      target: document.querySelector('#barcode-scanner')
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

export { load_quagga }
