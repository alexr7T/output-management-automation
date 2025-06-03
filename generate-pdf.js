const jsPDF = require('jspdf').jsPDF;
require('jspdf-autotable');

// Creation of a new PDF document
const doc = new jsPDF();

// Add a styled title
doc.setFont("helvetica", "bold");
doc.setFontSize(16);
doc.setTextColor(0, 0, 255);
doc.text('Invoice Details', 20, 20);

// Add invoice details 
doc.setFont("helvetica", "normal");
doc.setFontSize(12);
doc.setTextColor(0, 0, 0);
doc.text('Invoice Number: 85739103857392964', 20, 30);
doc.text('Date: 2025-02-20', 20, 40);

// Add customer details
doc.setFontSize(14);
doc.setFont("helvetica", "bold");
doc.text('Customer Information:', 20, 55);
doc.setFont("helvetica", "normal");
doc.setFontSize(12);
doc.text('Name: Micheal', 20, 65);
doc.text('Address: Main 1 Saint Parkes New York', 20, 75);
doc.text('Phone: 073 123 4866', 20, 85);
doc.text('Email: michealr@gmail.com', 20, 95);

// Separate line
doc.setLineWidth(0.5);
doc.line(20, 100, 190, 100);

// Add invoice items
doc.setFontSize(14);
doc.setFont("helvetica", "bold");
doc.text('Invoice Items:', 20, 115);

doc.autoTable({
    startY: 125,
    head: [['Item Description', 'Quantity', 'Price', 'VAT (%)', 'Discount (%)', 'Total']],
    body: [['Apple MacBook', '2', '7000', '19', '10', '14000']],
    theme: 'grid',
    styles: { fontSize: 12, cellPadding: 4 },
});

// Calculate where the table ends to position the totals.
const finalY = doc.lastAutoTable.finalY + 10;

// Adding totals
doc.setFont("helvetica", "bold");
doc.text('Total Amount: 14000', 20, finalY);
doc.text('Total VAT: 2660', 20, finalY + 10);
doc.text('Total Discount: 1400', 20, finalY + 20);
doc.setTextColor(255, 0, 0);
doc.text('Total to Pay: 12660', 20, finalY + 30);

// Save the PDF document
doc.save('invoice.pdf');