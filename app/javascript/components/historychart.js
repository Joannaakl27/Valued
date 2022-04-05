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
          label: 'kg CO2 equivalent emissions',
          data: JSON.parse(ctx.canvas.dataset.data),
          backgroundColor: [
            'rgb(131, 135, 245)'
          ],
          borderColor: [
            'rgb(131, 135, 245)'
          ],
          tension: 0.5,
          usePointStyle: true,
          pointStyle: 'circle',
          fill: false,
          pointRadius: 1,
          pointHoverRadius: 5,
          pointHoverBorderWidth: 5,
          pointBorderColor: 'transparent'
        }]
      },
      plugins: {
        legend: {
          position: 'top',
          align: 'start',
          labels: {
            usePointStyle: true,
            padding: 25,
            boxWidth: 6,
          }
        }
      }
    });
  }
}
export { initHistoryChart };
