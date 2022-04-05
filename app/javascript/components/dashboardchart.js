import "chart.js";
import Chart from 'chart.js/auto';

const initChart = () => {
  const myChartCanvas = document.getElementById('myChart');
  if (myChartCanvas) {
    const ctx = myChartCanvas.getContext('2d');
    const myChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
        labels: [
          '% FDFE'
        ],
        datasets: [{
          label: 'My Footprint',
          data: JSON.parse(ctx.canvas.dataset.data),
          backgroundColor: [
            'rgb(131, 135, 245)',
            'rgb(243, 243, 247)'
          ],
          cutout: '80%',
          radius: '80%',
          borderJoinStyle: 'round',
          hoverOffset: 4
        }]
      }
    });
  }
}

export { initChart };
