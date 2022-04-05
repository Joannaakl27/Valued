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
            'rgb(215,245,252)'
          ],
          cutout: '80%',
          radius: '70%',
          borderJoinStyle: 'round',
          hoverOffset: 4
        }]
        },
      options: {
        responsive: true,
        animation: {
          duration: 500
        },
        plugins: {
          legend: {
            display: false
          },
        }
      }
    });
  }
}
export { initShowChart };
