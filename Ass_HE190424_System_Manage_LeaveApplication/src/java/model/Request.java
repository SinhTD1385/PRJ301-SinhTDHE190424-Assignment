package model;

import java.sql.Date;
import java.sql.Timestamp;

public class Request {
    private int requestID;
    private Date fromDate;
    private Date toDate;
    private String reason;
    private String status;
    private String processingReason;
    private Timestamp processingDate;

    private User createdBy;
    private User processedBy;

    // getters & setters
    public int getRequestID() { return requestID; }
    public void setRequestID(int requestID) { this.requestID = requestID; }

    public Date getFromDate() { return fromDate; }
    public void setFromDate(Date fromDate) { this.fromDate = fromDate; }

    public Date getToDate() { return toDate; }
    public void setToDate(Date toDate) { this.toDate = toDate; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getProcessingReason() { return processingReason; }
    public void setProcessingReason(String processingReason) { this.processingReason = processingReason; }

    public Timestamp getProcessingDate() { return processingDate; }
    public void setProcessingDate(Timestamp processingDate) { this.processingDate = processingDate; }

    public User getCreatedBy() { return createdBy; }
    public void setCreatedBy(User createdBy) { this.createdBy = createdBy; }

    public User getProcessedBy() { return processedBy; }
    public void setProcessedBy(User processedBy) { this.processedBy = processedBy; }
}
