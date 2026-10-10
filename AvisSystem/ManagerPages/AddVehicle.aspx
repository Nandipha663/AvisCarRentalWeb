<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddVehicle.aspx.cs" Inherits="AvisSystem.ManagerPages.AddVehicle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <style>
        .add-vehicle-page {
            padding: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* PAGE HEADER */
        .page-header {
            margin-bottom: 25px;
        }

        .page-header h1 {
            font-size: 30px;
            font-weight: 700;
            color: #222;
            margin-bottom: 6px;
        }

        .page-header p {
            color: #777;
            font-size: 15px;
            margin: 0;
        }

        /* MAIN CARD */
        .vehicle-form-card {
            background: #fff;
            border: 1px solid #e6e6e6;
            border-radius: 14px;
            padding: 30px;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.06);
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 19px;
            font-weight: 700;
            color: #222;
            margin-bottom: 22px;
        }

        .section-title i {
            color: #c8102e;
        }

        /* FORM GRID */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 22px 25px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
        }

        .required {
            color: #c8102e;
        }

        /* MODERN INPUTS */
        .modern-input,
        .modern-select,
        .modern-textarea {
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #d9d9d9;
            border-radius: 9px;
            padding: 12px 14px;
            font-size: 14px;
            color: #333;
            background: #fff;
            outline: none;
            transition: all 0.2s ease;
        }

        .modern-input {
            height: 46px;
        }

        .modern-select {
            height: 46px;
            cursor: pointer;
        }

        .modern-textarea {
            min-height: 120px;
            resize: vertical;
            font-family: inherit;
        }

        .modern-input::placeholder,
        .modern-textarea::placeholder {
            color: #aaa;
        }

        .modern-input:focus,
        .modern-select:focus,
        .modern-textarea:focus {
            border-color: #c8102e;
            box-shadow: 0 0 0 3px rgba(200, 16, 46, 0.08);
        }

        /* IMAGE SECTION */
        .image-section {
            margin-top: 32px;
            padding-top: 28px;
            border-top: 1px solid #eeeeee;
        }

        .image-upload-area {
            display: flex;
            align-items: center;
            gap: 25px;
            padding: 20px;
            background: #fafafa;
            border: 1px solid #e5e5e5;
            border-radius: 12px;
        }

        .vehicle-image-preview {
            width: 230px;
            height: 150px;
            border-radius: 10px;
            border: 2px dashed #c8102e;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            flex-shrink: 0;
        }

        .vehicle-image-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .image-placeholder {
            text-align: center;
            color: #999;
        }

        .image-placeholder i {
            font-size: 38px;
            color: #c8102e;
            margin-bottom: 8px;
        }

        .image-placeholder span {
            display: block;
            font-size: 13px;
        }

        .image-info {
            flex: 1;
        }

        .image-info h3 {
            margin: 0 0 7px;
            font-size: 16px;
            color: #333;
        }

        .image-info p {
            margin: 0 0 15px;
            color: #888;
            font-size: 13px;
            line-height: 1.5;
        }

        /* CHANGE IMAGE BUTTON */
        .change-image-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 17px;
            background: #f3f0ff;
            color: #6f42c1;
            border: 1px solid #d8cdf5;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .change-image-btn:hover {
            background: #e9e2ff;
            border-color: #6f42c1;
        }

        .hidden-file-input {
            display: none;
        }

        /* BUTTON AREA */
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 32px;
            padding-top: 25px;
            border-top: 1px solid #eeeeee;
        }

        .action-btn {
            height: 45px;
            padding: 0 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        /* ADD VEHICLE */
        .add-btn {
            background: #c8102e;
            color: #fff;
            border: 1px solid #c8102e;
        }

        .add-btn:hover {
            background: #a90d27;
            border-color: #a90d27;
        }

        /* CANCEL */
        .cancel-btn {
            background: #fff;
            color: #c8102e;
            border: 1px solid #c8102e;
        }

        .cancel-btn:hover {
            background: #fff5f6;
        }

        /* CLEAR */
        .clear-btn {
            background: #f2f2f2;
            color: #555;
            border: 1px solid #ddd;
        }

        .clear-btn:hover {
            background: #e7e7e7;
        }

        /* RESPONSIVE */
        @media (max-width: 800px) {
            .add-vehicle-page {
                padding: 20px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: auto;
            }

            .image-upload-area {
                flex-direction: column;
                align-items: flex-start;
            }

            .form-actions {
                flex-wrap: wrap;
            }
        }
    </style>


    <div class="add-vehicle-page">

        <!-- PAGE HEADER -->
        <div class="page-header">
            <h1>Add New Vehicle</h1>
            <p>Add a new vehicle to the fleet by entering its details below.</p>
        </div>


        <!-- FORM CARD -->
        <div class="vehicle-form-card">

            <div class="section-title">
                <i class="fas fa-car"></i>
                Vehicle Information
            </div>


            <!-- VEHICLE DETAILS -->
            <div class="form-grid">

                <!-- REGISTRATION NUMBER -->
                <div class="form-group">
                    <label class="form-label">
                        Registration Number <span class="required">*</span>
                    </label>

                    <input type="text"
                           id="txtRegistrationNo"
                           class="modern-input"
                           placeholder="Enter registration number" />
                </div>


                <!-- MAKE -->
                <div class="form-group">
                    <label class="form-label">
                        Make <span class="required">*</span>
                    </label>

                    <input type="text"
                           id="txtMake"
                           class="modern-input"
                           placeholder="e.g. Toyota" />
                </div>


                <!-- MODEL -->
                <div class="form-group">
                    <label class="form-label">
                        Model <span class="required">*</span>
                    </label>

                    <input type="text"
                           id="txtModel"
                           class="modern-input"
                           placeholder="e.g. Corolla" />
                </div>


                <!-- CATEGORY -->
                <div class="form-group">
                    <label class="form-label">
                        Category <span class="required">*</span>
                    </label>

                    <select id="ddlCategory" class="modern-select">
                        <option value="">Select category</option>
                        <option value="Economy">Economy</option>
                        <option value="Compact">Compact</option>
                        <option value="Sedan">Sedan</option>
                        <option value="Luxury">Luxury</option>
                        <option value="SUV">SUV</option>
                        <option value="Premium">Premium</option>
                    </select>
                </div>


                <!-- STATUS -->
                <div class="form-group">
                    <label class="form-label">
                        Status <span class="required">*</span>
                    </label>

                    <select id="ddlStatus" class="modern-select">
                        <option value="">Select status</option>
                        <option value="Available">Available</option>
                        <option value="Rented">Rented</option>
                        <option value="In Maintenance">In Maintenance</option>
                        <option value="Out Of Service">Out Of Service</option>
                    </select>
                </div>


                <!-- BRANCH -->
                <div class="form-group">
                    <label class="form-label">
                        Branch Name <span class="required">*</span>
                    </label>

                    <select id="ddlBranch" class="modern-select">
                        <option value="">Select branch</option>
                        <option value="King Shaka Airport">King Shaka Airport</option>
                        <option value="Durban Downtown">Durban Downtown</option>
                        <option value="Umhlanga Branch">Umhlanga Branch</option>
                        <option value="Cape Town Airport">Cape Town Airport</option>
                        <option value="OR Tambo Airport">OR Tambo Airport</option>
                    </select>
                </div>


                <!-- DAILY RATE -->
                <div class="form-group">
                    <label class="form-label">
                        Daily Rate <span class="required">*</span>
                    </label>

                    <input type="number"
                           id="txtDailyRate"
                           class="modern-input"
                           placeholder="Enter daily rate"
                           min="0"
                           step="0.01" />
                </div>


                <!-- ODOMETER -->
                <div class="form-group">
                    <label class="form-label">
                        Odometer Reading <span class="required">*</span>
                    </label>

                    <input type="number"
                           id="txtOdometer"
                           class="modern-input"
                           placeholder="Enter current odometer reading"
                           min="0" />
                </div>


                <!-- VEHICLE DESCRIPTION -->
                <div class="form-group full-width">
                    <label class="form-label">
                        Vehicle Description
                    </label>

                    <textarea id="txtDescription"
                              class="modern-textarea"
                              placeholder="Enter a short description of the vehicle"></textarea>
                </div>

            </div>


            <!-- IMAGE SECTION -->
            <div class="image-section">

                <div class="section-title">
                    <i class="fas fa-image"></i>
                    Vehicle Image
                </div>

                <div class="image-upload-area">

                    <!-- IMAGE PREVIEW -->
                    <div class="vehicle-image-preview">

                        <div class="image-placeholder" id="imagePlaceholder">
                            <i class="fas fa-car"></i>
                            <span>No image selected</span>
                        </div>

                        <img id="vehicleImage"
                             src=""
                             alt="Vehicle Preview"
                             style="display:none;" />

                    </div>


                    <!-- IMAGE INFORMATION -->
                    <div class="image-info">

                        <h3>Upload Vehicle Image</h3>

                        <p>
                            Add a clear image of the vehicle. The selected image
                            will appear in the preview box.
                        </p>

                        <label for="imageUpload" class="change-image-btn">
                            <i class="fas fa-camera"></i>
                            Change Image
                        </label>

                        <input type="file"
                               id="imageUpload"
                               class="hidden-file-input"
                               accept="image/*" />

                    </div>

                </div>

            </div>


            <!-- BUTTONS -->
            <div class="form-actions">

                <!-- CLEAR -->
                <button type="button"
                        class="action-btn clear-btn"
                        onclick="clearForm();">
                    <i class="fas fa-eraser"></i>
                    Clear
                </button>


                <!-- CANCEL -->
                <button type="button"
                        class="action-btn cancel-btn"
                        onclick="window.history.back();">
                    <i class="fas fa-times"></i>
                    Cancel
                </button>


                <!-- ADD VEHICLE -->
                <button type="button"
                        class="action-btn add-btn"
                        onclick="addVehicle();">
                    <i class="fas fa-plus"></i>
                    Add Vehicle
                </button>

            </div>

        </div>

    </div>


    <script>

        /* ==========================
           IMAGE PREVIEW
        ========================== */

        document.getElementById("imageUpload").addEventListener("change", function () {

            const file = this.files[0];

            if (file) {

                const reader = new FileReader();

                reader.onload = function (e) {

                    const image = document.getElementById("vehicleImage");
                    const placeholder = document.getElementById("imagePlaceholder");

                    image.src = e.target.result;

                    image.style.display = "block";
                    placeholder.style.display = "none";
                };

                reader.readAsDataURL(file);
            }

        });


        /* ==========================
           CLEAR FORM
        ========================== */

        function clearForm() {

            document.getElementById("txtRegistrationNo").value = "";
            document.getElementById("txtMake").value = "";
            document.getElementById("txtModel").value = "";

            document.getElementById("ddlCategory").value = "";
            document.getElementById("ddlStatus").value = "";
            document.getElementById("ddlBranch").value = "";

            document.getElementById("txtDailyRate").value = "";
            document.getElementById("txtOdometer").value = "";
            document.getElementById("txtDescription").value = "";

            document.getElementById("imageUpload").value = "";

            document.getElementById("vehicleImage").style.display = "none";
            document.getElementById("vehicleImage").src = "";

            document.getElementById("imagePlaceholder").style.display = "block";
        }


        /* ==========================
           ADD VEHICLE
        ========================== */

        function addVehicle() {

            alert("Vehicle added successfully!");

            // Later this button can be connected
            // to your ASP.NET C# code and database.
        }

    </script>

</asp:Content>
