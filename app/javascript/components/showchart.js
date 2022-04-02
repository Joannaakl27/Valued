import "chart.js";
import Chart from 'chart.js/auto';

const initShowChart = () => {
  const showChartCanvas = document.getElementById('showChart');
  if (showChartCanvas) {

    const ctx = showChartCanvas.getContext('2d');
    const showChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
        labels: [
          'Agriculture',
          'Processing',
          'Packaging',
          'Transportation',
          'Distribution',
          'Consumption'
        ],
        datasets: [{
          label: 'Life Cycle Emissions',
          data: JSON.parse(ctx.canvas.dataset.data),
          backgroundColor: [
            'rgb(131, 135, 245)',
            'rgb(3, 195, 236)',
            'rgb(113, 221, 55)',
            'rgb(133, 146, 163)',
            'rgb(231, 231, 255)',
            'rgba(231, 231, 255)'
          ],
          cutout: '80%',
          radius: '90%',
          borderJoinStyle: 'round',
          hoverOffset: 4
        }]
      }
    });
  }
}
export { initShowChart };
