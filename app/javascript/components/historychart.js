import "chart.js";
import Chart from 'chart.js/auto';

const initHistoryChart = () => {
  const historyChartCanvas = document.getElementById('historyChart');
  if (historyChartCanvas) {
    const ctx = historyChartCanvas.getContext('2d');
    const historyChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: JSON.parse(ctx.canvas.dataset.labels),

        datasets: [{
          label: 'Emissions History',
          data: JSON.parse(ctx.canvas.dataset.data),
          backgroundColor: [
            'rgb(131, 135, 245)'
          ],
        }]
      }
    });
  }
}
export { initHistoryChart };
