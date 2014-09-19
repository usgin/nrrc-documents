<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="fn xs xsi xsl usgin"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.isotc211.org/2005/gmd"
		xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco"
		xmlns:gml="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:gmx="http://www.isotc211.org/2005/gmx"
		xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:usgin="http://resources.usgin.org/xslt/ISO2USGINISO"
		xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xs="http://www.w3.org/2001/XMLSchema"
		xsi:schemaLocation="http://www.isotc211.org/2005/gmd http://schemas.opengis.net/csw/2.0.2/profiles/apiso/1.0.0/apiso.xsd">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:param name="metadataMaintenanceNote"
			select="'This metadata record has been processed by the NRRC USGIN iso-19115-to-usgin-19115-data XSLT to ensure that all mandatory content for USGIN profile has been added.'"/>
	<xsl:template match="root">
		<xsl:variable name="var_InputRootNode" select="."/>
		<gmd:MD_Metadata xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gml="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.isotc211.org/2005/gmd http://schemas.opengis.net/csw/2.0.2/profiles/apiso/1.0.0/apiso.xsd">
			<xsl:apply-templates select="metadata_uuid"/>

			<gmd:language>
				<gco:CharacterString>eng</gco:CharacterString>
			</gmd:language>

			<gmd:characterSet>
				<gmd:MD_CharacterSetCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode" codeListValue="utf8">UTF-8</gmd:MD_CharacterSetCode>
			</gmd:characterSet>

			<xsl:apply-templates select="resource_type"/>

			<gmd:contact>
				<gmd:CI_ResponsibleParty>
					<gmd:organisationName>
						<gco:CharacterString>Arizona Geological Survey</gco:CharacterString>
					</gmd:organisationName>
					<gmd:contactInfo>
						<gmd:CI_Contact>
							<gmd:phone>
								<gmd:CI_Telephone>
									<gmd:voice>
										<gco:CharacterString>520.770.3500</gco:CharacterString>
									</gmd:voice>
									<gmd:facsimile>
										<gco:CharacterString>520.770.3505</gco:CharacterString>
									</gmd:facsimile>
								</gmd:CI_Telephone>
							</gmd:phone>
							<gmd:address>
								<gmd:CI_Address>
									<gmd:deliveryPoint>
										<gco:CharacterString>416 W. Congress, Ste # 100</gco:CharacterString>
									</gmd:deliveryPoint>
									<gmd:city>
										<gco:CharacterString>Tucson</gco:CharacterString>
									</gmd:city>
									<gmd:administrativeArea>
										<gco:CharacterString>AZ</gco:CharacterString>
									</gmd:administrativeArea>
									<gmd:postalCode>
										<gco:CharacterString>85701-1381</gco:CharacterString>
									</gmd:postalCode>
									<gmd:country>
										<gco:CharacterString>USA</gco:CharacterString>
									</gmd:country>
									<gmd:electronicMailAddress>
										<gco:CharacterString>metadata@usgin.org</gco:CharacterString>
									</gmd:electronicMailAddress>
								</gmd:CI_Address>
							</gmd:address>
							<gmd:onlineResource>
								<gmd:CI_OnlineResource>
									<gmd:linkage>
										<gmd:URL>http://www.azgs.az.gov</gmd:URL>
									</gmd:linkage>
									<gmd:protocol>
										<gco:CharacterString>http</gco:CharacterString>
									</gmd:protocol>
								</gmd:CI_OnlineResource>
							</gmd:onlineResource>
						</gmd:CI_Contact>
					</gmd:contactInfo>
					<gmd:role>
						<gmd:CI_RoleCode codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode" codeListValue="pointOfContact">pointOfContact</gmd:CI_RoleCode>
					</gmd:role>
				</gmd:CI_ResponsibleParty>
			</gmd:contact>

			<!-- end contact for metadata -->
			<gmd:dateStamp>
				<gco:DateTime>					
					<xsl:call-template name="usgin:dateFormat">						
						<xsl:with-param name="inputDate" select="$var_InputRootNode/publication_date"/>	
					</xsl:call-template>			
				</gco:DateTime>
			</gmd:dateStamp>
			<gmd:metadataStandardName>
				<gco:CharacterString>ISO-NAP-USGIN</gco:CharacterString>
			</gmd:metadataStandardName>
			<gmd:metadataStandardVersion>
				<gco:CharacterString>1.1.4</gco:CharacterString>
			</gmd:metadataStandardVersion>
			<!-- dataSetURI will be a concatenation of resource URL and the date of edit to the section.-->
			<gmd:dataSetURI>
				<gco:CharacterString>
					<xsl:value-of select="concat(/record/resource_url,'2013-10-18T12:00:00Z')"/>
				</gco:CharacterString>
			</gmd:dataSetURI>
			<gmd:identificationInfo>
				<gmd:MD_DataIdentification>
					<gmd:citation>
						<gmd:CI_Citation>
							<gmd:title>
								<gco:CharacterString>
									<xsl:value-of select="title"/>
								</gco:CharacterString>
							</gmd:title>
							<gmd:date>
								<gmd:CI_Date>
									<gmd:date>
										<gco:DateTime>					
											<xsl:call-template name="usgin:dateFormat">						
												<xsl:with-param name="inputDate" select="$var_InputRootNode/publication_date"/>	
											</xsl:call-template>			
										</gco:DateTime>
									</gmd:date>

									<gmd:dateType>
										<gmd:CI_DateTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode" codeListValue="publication">publication</gmd:CI_DateTypeCode>
									</gmd:dateType>
								</gmd:CI_Date>
							</gmd:date>

							<xsl:if test="string-length(effective_on)>0">
								<gmd:date>
									<gmd:CI_Date>
										<gmd:date>
											<gco:DateTime>		
												<xsl:value-of select="concat(effective_on,'T12:00:00Z')"/>
											</gco:DateTime>
										</gmd:date>
										<gmd:dateType>
											<gmd:CI_DateTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode" codeListValue="federal_register">federal_register</gmd:CI_DateTypeCode>
										</gmd:dateType>
									</gmd:CI_Date>
								</gmd:date>
							</xsl:if>

							<xsl:if test="string-length(comments_close_on)>0">
								<gmd:date>
									<gmd:CI_Date>
										<gmd:date>
											<gco:DateTime>		
												<xsl:value-of select="concat(comments_close_on,'T12:00:00Z')"/>
											</gco:DateTime>
										</gmd:date>
										<gmd:dateType>
											<gmd:CI_DateTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode" codeListValue="comment closing date">comment closing date</gmd:CI_DateTypeCode>
										</gmd:dateType>
									</gmd:CI_Date>
								</gmd:date>
							</xsl:if>

							<xsl:if test="string-length(signing_date)>0">
								<gmd:date>
									<gmd:CI_Date>
										<gmd:date>
											<gco:DateTime>		
												<xsl:value-of select="concat(signing_date,'T12:00:00Z')"/>
											</gco:DateTime>
										</gmd:date>
										<gmd:dateType>
											<gmd:CI_DateTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode" codeListValue="comment closing date">comment closing date</gmd:CI_DateTypeCode>
										</gmd:dateType>
									</gmd:CI_Date>
								</gmd:date>
							</xsl:if>


							<xsl:if test="citation">
								<gmd:identifier>
									<gmd:MD_Identifier>
									
									<gmd:authority>
					<xsl:attribute name="xlink:title"><xsl:value-of select="'/root/citation'"></xsl:value-of></xsl:attribute>
									</gmd:authority>
									
									
										<gmd:code>
											<gco:CharacterString>
												<xsl:value-of select="citation"/>								
											</gco:CharacterString>
										</gmd:code>
									</gmd:MD_Identifier>
								</gmd:identifier>
							</xsl:if>
							<xsl:if test="mods_url">	
								<gmd:identifier>
									<gmd:MD_Identifier>
										<gmd:code>
											<gco:CharacterString>
												<xsl:value-of select="mods_url"/>								
											</gco:CharacterString>
										</gmd:code>
									</gmd:MD_Identifier>
								</gmd:identifier>
							</xsl:if>
							<xsl:if test="string-length(executive_order_number)>0">
								<gmd:identifier>
									<gmd:MD_Identifier>
										<gmd:code>
											<gco:CharacterString>
												<xsl:value-of select="executive_order_number"/>								
											</gco:CharacterString>
										</gmd:code>
									</gmd:MD_Identifier>
								</gmd:identifier>		
							</xsl:if>	
							<xsl:if test="string-length(document_number)>0">
								<gmd:identifier>
									<gmd:MD_Identifier>
										<gmd:code>
											<gco:CharacterString>
												<xsl:value-of select="document_number"/>								
											</gco:CharacterString>
										</gmd:code>
									</gmd:MD_Identifier>
								</gmd:identifier>		
							</xsl:if>
							
							
							
							<xsl:if test="string-length(topics)>0">
								<gmd:identifier>
									<gmd:MD_Identifier>
									<gmd:authority xlink:codespace="">
					<xsl:attribute name="xlink:codespace"><xsl:value-of select="."></xsl:value-of></xsl:attribute>
									</gmd:authority>
										<gmd:code>
											<gco:CharacterString>
												<xsl:value-of select="topics"/>								
											</gco:CharacterString>
										</gmd:code>
									</gmd:MD_Identifier>
								</gmd:identifier>		
							</xsl:if>
							
							
							
							<xsl:if test="string-length(docket_ids/item)>0">
								<gmd:identifier>
									<gmd:MD_Identifier>
										<gmd:code>
											<gco:CharacterString>
												<xsl:value-of select="docket_ids/item"/>								
											</gco:CharacterString>
										</gmd:code>
									</gmd:MD_Identifier>
								</gmd:identifier>		
							</xsl:if>




							<!-- there are multiple authors on some resoruces, so have to allow for multiple individual names; each gets a citedResponsibleParty element. The csv scheme doesn't allow different bindings between organizations and individuals in this context... -->
							<xsl:choose>
								<xsl:when test="originator_contact_person_name">
									<xsl:for-each select="originator_contact_person_name">
										<gmd:citedResponsibleParty>
											<gmd:CI_ResponsibleParty>
												<gmd:individualName>
													<gco:CharacterString>
														<xsl:value-of select="."/>
													</gco:CharacterString>
												</gmd:individualName>
												<xsl:apply-templates select="//originator_contact_org_name"/>
												<xsl:apply-templates select="//originator_contact_position_name"/>
												<gmd:contactInfo>
													<gmd:CI_Contact>
														<xsl:variable name="voicePhone" select="//originator_contact_phone"/>
														<xsl:variable name="faxPhone" select="//originator_contact_fax"/>
														<xsl:choose>
															<xsl:when test="($voicePhone != '') and not(contains($voicePhone,'missing'))">
																<!-- have a voice phone number, use that -->
																<gmd:phone>
																	<gmd:CI_Telephone>
																		<gmd:voice>
																			<gco:CharacterString>
																				<xsl:value-of select="$voicePhone"/>
																			</gco:CharacterString>
																		</gmd:voice>
																	</gmd:CI_Telephone>
																</gmd:phone>
															</xsl:when>
															<xsl:when test="($faxPhone != '') and not(contains($faxPhone,'missing'))">
																<!-- have a fax phone number, use that -->
																<gmd:phone>
																	<gmd:CI_Telephone>
																		<gmd:facsimile>
																			<gco:CharacterString>
																				<xsl:value-of select="$faxPhone"/>
																			</gco:CharacterString>
																		</gmd:facsimile>
																	</gmd:CI_Telephone>
																</gmd:phone>
															</xsl:when>
														</xsl:choose>
														<xsl:if test="//originator_contact_street_address != '' or //originator_contact_email != ''">
															<gmd:address>
																<gmd:CI_Address>
																	<xsl:apply-templates select="//originator_contact_street_address"/>
																	<xsl:apply-templates select="//originator_contact_city"/>
																	<xsl:apply-templates select="//originator_contact_state"/>
																	<xsl:apply-templates select="//originator_contact_zip"/>
																	<xsl:apply-templates select="//originator_contact_email"/>
																</gmd:CI_Address>
															</gmd:address>
														</xsl:if>
														<xsl:apply-templates select="//originator_contact_url"/>
													</gmd:CI_Contact>
												</gmd:contactInfo>
												<gmd:role>
													<gmd:CI_RoleCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_RoleCode" codeListValue="distributor">pointOfContact</gmd:CI_RoleCode>
												</gmd:role>
											</gmd:CI_ResponsibleParty>
										</gmd:citedResponsibleParty>
									</xsl:for-each>
								</xsl:when>
								<!-- end of handler for one or more originator_contact_person_name, now handle case with no originator_contact_person_name values -->
								<xsl:otherwise>
									<gmd:citedResponsibleParty>
										<gmd:CI_ResponsibleParty>
											<!-- assume won't have multiple org names or position names... -->
											<xsl:apply-templates select="//originator_contact_org_name"/>
											<xsl:apply-templates select="//originator_contact_position_name"/>
											<gmd:contactInfo>
												<gmd:CI_Contact>
													<xsl:variable name="voicePhone" select="//originator_contact_phone"/>
													<xsl:variable name="faxPhone" select="//originator_contact_fax"/>
													<xsl:choose>
														<xsl:when test="($voicePhone != '') and not(contains($voicePhone,'missing'))">
															<!-- have a voice phone number, use that -->
															<gmd:phone>
																<gmd:CI_Telephone>
																	<gmd:voice>
																		<gco:CharacterString>
																			<xsl:value-of select="$voicePhone"/>
																		</gco:CharacterString>
																	</gmd:voice>
																</gmd:CI_Telephone>
															</gmd:phone>
														</xsl:when>
														<xsl:when test="($faxPhone != '') and not(contains($faxPhone,'missing'))">
															<!-- have a fax phone number, use that -->
															<gmd:phone>
																<gmd:CI_Telephone>
																	<gmd:facsimile>
																		<gco:CharacterString>
																			<xsl:value-of select="$faxPhone"/>
																		</gco:CharacterString>
																	</gmd:facsimile>
																</gmd:CI_Telephone>
															</gmd:phone>
														</xsl:when>
													</xsl:choose>
													<xsl:if test="//originator_contact_street_address != '' or //originator_contact_email != ''">
														<gmd:address>
															<gmd:CI_Address>
																<xsl:apply-templates select="//originator_contact_street_address"/>
																<xsl:apply-templates select="//originator_contact_city"/>
																<xsl:apply-templates select="//originator_contact_state"/>
																<xsl:apply-templates select="//originator_contact_zip"/>
																<xsl:apply-templates select="//originator_contact_email"/>
															</gmd:CI_Address>
														</gmd:address>
													</xsl:if>
													<xsl:apply-templates select="//originator_contact_url"/>
												</gmd:CI_Contact>
											</gmd:contactInfo>
											<gmd:role>
												<gmd:CI_RoleCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_RoleCode" codeListValue="distributor">pointOfContact</gmd:CI_RoleCode>
											</gmd:role>
										</gmd:CI_ResponsibleParty>
									</gmd:citedResponsibleParty>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:apply-templates select="bibliographic_citation"/>

							<gmd:series>
								<gmd:CI_Series>
									<gmd:name>
										<!-- Name of the publication series or aggregate dataset of which the referenced dataset is a part. Federal Regi start and end page -->
										<gco:CharacterString></gco:CharacterString>
									</gmd:name>
									<gmd:page>
										<gco:CharacterString>
											<xsl:value-of select="concat(start_page,'-',end_page)"/>
										</gco:CharacterString>
									</gmd:page>
								</gmd:CI_Series>
							</gmd:series>




						</gmd:CI_Citation>
					</gmd:citation>
					<gmd:abstract>
						<gco:CharacterString>
							<xsl:value-of select="abstract"/>
						</gco:CharacterString>
					</gmd:abstract>
					<gmd:status>
						<gmd:MD_ProgressCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_ProgressCode" codeListValue="completed">completed</gmd:MD_ProgressCode>
					</gmd:status>
					<xsl:if test="keywords_thematic != ''">
						<gmd:descriptiveKeywords>
							<gmd:MD_Keywords>
								<xsl:apply-templates select="//keywords_thematic"/>
								<gmd:type>
									<gmd:MD_KeywordTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode" codeListValue="theme">theme</gmd:MD_KeywordTypeCode>
								</gmd:type>
							</gmd:MD_Keywords>
						</gmd:descriptiveKeywords>
					</xsl:if>
					<xsl:if test="keywords_temporal != ''">
						<gmd:descriptiveKeywords>
							<gmd:MD_Keywords>
								<xsl:apply-templates select="//keywords_temporal"/>
								<gmd:type>
									<gmd:MD_KeywordTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode" codeListValue="temporal">temporal</gmd:MD_KeywordTypeCode>
								</gmd:type>
							</gmd:MD_Keywords>
						</gmd:descriptiveKeywords>
					</xsl:if>
					<xsl:if test="keywords_spatial != ''">
						<gmd:descriptiveKeywords>
							<gmd:MD_Keywords>
								<xsl:apply-templates select="//keywords_spatial"/>
								<gmd:type>
									<gmd:MD_KeywordTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode" codeListValue="place">place</gmd:MD_KeywordTypeCode>
								</gmd:type>
							</gmd:MD_Keywords>
						</gmd:descriptiveKeywords>
					</xsl:if>
					<gmd:language>
					<gco:CharacterString>eng</gco:CharacterString>
			</gmd:language>
			<gmd:characterSet>
			<gmd:MD_CharacterSetCode codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode " codeListValue="utf8">UTF-8</gmd:MD_CharacterSetCode>
			</gmd:characterSet>
					<gmd:topicCategory>
						<gmd:MD_TopicCategoryCode>geoscientificInformation</gmd:MD_TopicCategoryCode>
					</gmd:topicCategory>
					<gmd:extent>
					<gmd:EX_Extent>
									<gmd:geographicElement gco:nilReason="missing"/>
					</gmd:EX_Extent>
					</gmd:extent>
				</gmd:MD_DataIdentification>
			</gmd:identificationInfo>
			
				<gmd:distributionInfo>
					<gmd:MD_Distribution>
			
							<gmd:distributor>
								<gmd:MD_Distributor>
									<gmd:distributorContact>
										<gmd:CI_ResponsibleParty>
											<xsl:apply-templates select="//distributor_contact_person_name"/>
											<xsl:apply-templates select="//distributor_contact_org_name"/>
											<xsl:apply-templates select="//distributor_contact_position_name"/>
											<gmd:contactInfo>
												<gmd:CI_Contact>
													<xsl:variable name="voicePhone" select="distributor_contact_phone"/>
													<xsl:variable name="faxPhone" select="distributor_contact_fax"/>
													<xsl:choose>
														<xsl:when test="($voicePhone != '') and not(contains($voicePhone,'missing'))">
															<!-- have a voice phone number, use that -->
															<gmd:phone>
																<gmd:CI_Telephone>
																	<gmd:voice>
																		<gco:CharacterString>
																			<xsl:value-of select="$voicePhone"/>
																		</gco:CharacterString>
																	</gmd:voice>
																</gmd:CI_Telephone>
															</gmd:phone>
														</xsl:when>
														<xsl:when test="($faxPhone != '') and not(contains($faxPhone,'missing'))">
															<!-- have a fax phone number, use that -->
															<gmd:phone>
																<gmd:CI_Telephone>
																	<gmd:facsimile>
																		<gco:CharacterString>
																			<xsl:value-of select="$faxPhone"/>
																		</gco:CharacterString>
																	</gmd:facsimile>
																</gmd:CI_Telephone>
															</gmd:phone>
														</xsl:when>
													</xsl:choose>
													<xsl:if test="distributor_contact_street_address != ''">
														<gmd:address>
															<gmd:CI_Address>
																<xsl:apply-templates select="//distributor_contact_street_address"/>
																<xsl:apply-templates select="//distributor_contact_city"/>
																<xsl:apply-templates select="//distributor_contact_state"/>
																<xsl:apply-templates select="//distributor_contact_zip"/>
																<xsl:apply-templates select="//distributor_contact_email"/>
															</gmd:CI_Address>
														</gmd:address>
													</xsl:if>
													<xsl:apply-templates select="distributor_contact_url"/>
												</gmd:CI_Contact>
											</gmd:contactInfo>
											<gmd:role>
												<gmd:CI_RoleCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_RoleCode" codeListValue="distributor">distributor</gmd:CI_RoleCode>
											</gmd:role>
										</gmd:CI_ResponsibleParty>
									</gmd:distributorContact>
									<xsl:apply-templates select="dates"/>
								</gmd:MD_Distributor>
							</gmd:distributor>
				
						<!-- link types (distributions) - there might be even more -->
						<xsl:if test="string-length(body_html_url)>0">
							<xsl:apply-templates select="body_html_url"/>
						</xsl:if>
						<xsl:if test="string-length(pdf_url)>0">
							<xsl:apply-templates select="pdf_url"/>
						</xsl:if>
						<xsl:if test="string-length(raw_text_url)>0">
							<xsl:apply-templates select="raw_text_url"/>
						</xsl:if>
						<xsl:if test="string-length(json_url)>0">
							<xsl:apply-templates select="json_url"/>
						</xsl:if>
						<xsl:if test="string-length(public_inspection_pdf_url)>0">
							<xsl:apply-templates select="public_inspection_pdf_url"/>
						</xsl:if>
						<xsl:if test="string-length(html_url)>0">
							<xsl:apply-templates select="html_url"/>
						</xsl:if>
						<xsl:if test="string-length(full_text_xml_url)>0">
							<xsl:apply-templates select="full_text_xml_url"/>
						</xsl:if>
						<xsl:if test="string-length(raw_text_url)>0">
							<xsl:apply-templates select="raw_text_url"/>
						</xsl:if>
						<xsl:if test="string-length(comment_url)>0">
							<xsl:apply-templates select="comment_url"/>
						</xsl:if>
						<xsl:if test="string-length(abstract_html_url)>0">
							<xsl:apply-templates select="abstract_html_url"/>
						</xsl:if>
						<xsl:if test="string-length(html_url)>0">
							<xsl:apply-templates select="html_url"/>
						</xsl:if>

					</gmd:MD_Distribution>
				</gmd:distributionInfo>
	
			<xsl:if test="(resource_quality_statement != '') or (resource_lineage_statement != '')">
				<gmd:dataQualityInfo>
					<gmd:DQ_DataQuality>
						<gmd:scope>
							<gmd:DQ_Scope>
								<gmd:level>
									<gmd:MD_ScopeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_ScopeCode" codeListValue="dataset">dataset</gmd:MD_ScopeCode>
								</gmd:level>
							</gmd:DQ_Scope>
						</gmd:scope>
						<xsl:if test="resource_quality_statement != ''">
							<xsl:apply-templates select="//resource_quality_statement"/>
						</xsl:if>
						<xsl:if test="resource_lineage_statement != ''">
							<xsl:apply-templates select="//resource_lineage_statement"/>
						</xsl:if>
					</gmd:DQ_DataQuality>
				</gmd:dataQualityInfo>
			</xsl:if>
			<xsl:apply-templates select="resource_constraints_statement"/>

			<gmd:metadataMaintenance>
				<gmd:MD_MaintenanceInformation>
					<xsl:choose>
						<xsl:when
								test="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:maintenanceAndUpdateFrequency">
							<!--   <xsl:copy-of select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:maintenanceAndUpdateFrequency"/>-->
							<xsl:apply-templates
									select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:maintenanceAndUpdateFrequency"
									mode="no-namespaces"/>
						</xsl:when>
						<xsl:otherwise>
							<gmd:maintenanceAndUpdateFrequency>
								<!--no update frequency in source metadata, USGIN XSLT inserted 'irregular' as a default -->
								<gmd:MD_MaintenanceFrequencyCode
										codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_MaintenanceFrequencyCode"
										codeListValue="IRREGULAR">irregular
								</gmd:MD_MaintenanceFrequencyCode>
							</gmd:maintenanceAndUpdateFrequency>
						</xsl:otherwise>
					</xsl:choose>
					<!--<xsl:copy-of select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:dateOfNextUpdate"/>-->
					<xsl:apply-templates
							select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:dateOfNextUpdate"
							mode="no-namespaces"/>
					<!-- <xsl:copy-of select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:userDefinedMaintenanceFrequency"/>-->
					<xsl:apply-templates
							select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:userDefinedMaintenanceFrequency"
							mode="no-namespaces"/>
					<!-- <xsl:copy-of
                        select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:updateScope"/>-->
					<xsl:apply-templates
							select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:updateScope"
							mode="no-namespaces"/>
					<!--  <xsl:copy-of
                        select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:updateScopeDescription"/>-->
					<xsl:apply-templates
							select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:updateScopeDescription"
							mode="no-namespaces"/>
					<!--<xsl:copy-of select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:maintenanceNote"/>-->
					<xsl:apply-templates
							select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:maintenanceNote"
							mode="no-namespaces"/>
					<!-- add a note that the record has been processed by this xslt -->
					<gmd:maintenanceNote>
						<gco:CharacterString>
							<xsl:value-of
									select="concat($metadataMaintenanceNote, '2013-04-04T12:00:00')"/>
						</gco:CharacterString>
					</gmd:maintenanceNote>
					<!--  <xsl:copy-of
                        select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:contact"
                    />-->
					<xsl:apply-templates
							select="$var_InputRootNode/gmd:metadataMaintenance/gmd:MD_MaintenanceInformation/gmd:contact"
							mode="no-namespaces"/>
				</gmd:MD_MaintenanceInformation>
			</gmd:metadataMaintenance>

		</gmd:MD_Metadata>
	</xsl:template>




	<!-- Will be matching many -->
	<xsl:template match="metadata_uuid">
		<gmd:fileIdentifier>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:fileIdentifier>
	</xsl:template>
	<xsl:template match="resource_type">
		<gmd:hierarchyLevel>
			<gmd:MD_ScopeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_ScopeCode" codeListValue="">
				<xsl:attribute name="codeListValue"><xsl:text>dataset</xsl:text></xsl:attribute>
				<xsl:choose>
					<xsl:when test="(.='') or (.='Missing')">
						<xsl:text>Dataset</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
			</gmd:MD_ScopeCode>
		</gmd:hierarchyLevel>
		<gmd:hierarchyLevelName>
			<gco:CharacterString>
				<xsl:value-of select="type"/>
			</gco:CharacterString>
		</gmd:hierarchyLevelName>
	</xsl:template>

	<!--originator information -->

	<xsl:template match="originator_contact_person_name">
		<gmd:individualName>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:individualName>
	</xsl:template>
	<xsl:template match="originator_contact_org_name">
		<gmd:organisationName>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:organisationName>
	</xsl:template>
	<xsl:template match="originator_contact_position_name">
		<gmd:positionName>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:positionName>
	</xsl:template>
	<xsl:template match="originator_contact_phone_fax_flag">
		<xsl:variable name="voicePhone" select="//originator_contact_phone"/>
		<xsl:variable name="faxPhone" select="//originator_contact_fax"/>
		<xsl:choose>
			<xsl:when test="($voicePhone != '') and not(contains($voicePhone,'missing'))">
				<!-- have a voice phone number, use that -->
				<gmd:phone>
					<gmd:CI_Telephone>
						<gmd:voice>
							<gco:CharacterString>
								<xsl:value-of select="$voicePhone"/>
							</gco:CharacterString>
						</gmd:voice>
					</gmd:CI_Telephone>
				</gmd:phone>
			</xsl:when>
			<xsl:when test="($faxPhone != '') and not(contains($faxPhone,'missing'))">
				<!-- have a fax phone number, use that -->
				<gmd:phone>
					<gmd:CI_Telephone>
						<gmd:facsimile>
							<gco:CharacterString>
								<xsl:value-of select="$faxPhone"/>
							</gco:CharacterString>
						</gmd:facsimile>
					</gmd:CI_Telephone>
				</gmd:phone>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//originator_contact_phone">
		<gmd:voice>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:voice>
	</xsl:template>
	<xsl:template match="//originator_contact_fax">
		<gmd:facsimile>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:facsimile>
	</xsl:template>
	<xsl:template match="originator_contact_address_flag">
		<gmd:address>
			<gmd:CI_Address>
				<xsl:apply-templates select="//originator_contact_street_address"/>
				<xsl:apply-templates select="//originator_contact_city"/>
				<xsl:apply-templates select="//originator_contact_state"/>
				<xsl:apply-templates select="//originator_contact_zip"/>
				<xsl:apply-templates select="//originator_contact_email"/>
			</gmd:CI_Address>
		</gmd:address>
	</xsl:template>
	<xsl:template match="//originator_contact_street_address">
		<gmd:deliveryPoint>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:deliveryPoint>
	</xsl:template>
	<xsl:template match="//originator_contact_city">
		<gmd:city>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:city>
	</xsl:template>
	<xsl:template match="//originator_contact_state">
		<gmd:administrativeArea>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:administrativeArea>
	</xsl:template>
	<xsl:template match="//originator_contact_zip">
		<gmd:postalCode>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:postalCode>
	</xsl:template>
	<xsl:template match="//originator_contact_email">
		<gmd:electronicMailAddress>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:electronicMailAddress>
	</xsl:template>
	<xsl:template match="originator_contact_url">
		<gmd:onlineResource>
			<gmd:CI_OnlineResource>
				<gmd:linkage>
					<gmd:URL>
						<xsl:value-of select="."/>
					</gmd:URL>
				</gmd:linkage>
			</gmd:CI_OnlineResource>
		</gmd:onlineResource>
	</xsl:template>

	<xsl:template match="bibliographic_citation">
		<gmd:otherCitationDetails>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:otherCitationDetails>
	</xsl:template>
	
	<xsl:template match="keywords_thematic_flag">
		<gmd:descriptiveKeywords>
			<gmd:MD_Keywords>
				<xsl:apply-templates select="//keywords_thematic"/>
				<gmd:type>
					<gmd:MD_KeywordTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode" codeListValue="theme">theme</gmd:MD_KeywordTypeCode>
				</gmd:type>
			</gmd:MD_Keywords>
		</gmd:descriptiveKeywords>
	</xsl:template>
	<xsl:template match="//keywords_thematic">
		<gmd:keyword>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:keyword>
	</xsl:template>
	<xsl:template match="keywords_temporal_flag">
		<gmd:descriptiveKeywords>
			<gmd:MD_Keywords>
				<xsl:apply-templates select="//keywords_temporal"/>
				<gmd:type>
					<gmd:MD_KeywordTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode" codeListValue="temporal">temporal</gmd:MD_KeywordTypeCode>
				</gmd:type>
			</gmd:MD_Keywords>
		</gmd:descriptiveKeywords>
	</xsl:template>
	<xsl:template match="//keywords_temporal">
		<gmd:keyword>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:keyword>
	</xsl:template>
	<xsl:template match="related_resource">
		<gmd:aggregationInfo>
			<!-- (?-C) MD_AggregateInformation requires either aggregateDataSetName/CI_Citation or aggregateDataSetIdentifier/MD_Identifier.   -->
			<gmd:MD_AggregateInformation>
				<gmd:aggregateDataSetIdentifier>
					<gmd:MD_Identifier>
						<gmd:code>
							<gco:CharacterString>
								<xsl:value-of select="."/>
							</gco:CharacterString>
						</gmd:code>
					</gmd:MD_Identifier>
				</gmd:aggregateDataSetIdentifier>
				<!-- (M-M) Association Type is mandatory.. -->
				<gmd:associationType>
					<gmd:DS_AssociationTypeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#DS_AssociationTypeCode" codeListValue="crossReference">
						<xsl:text>crossReference</xsl:text>
					</gmd:DS_AssociationTypeCode>
				</gmd:associationType>
			</gmd:MD_AggregateInformation>
		</gmd:aggregationInfo>
	</xsl:template>
	<xsl:template match="resource_languages">
		<gmd:language>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:language>
	</xsl:template>
	<!-- Fed Reg does not contain bounding info-->
	<xsl:template match="east_bounding_longitude">
		<gmd:eastBoundLongitude>
			<gco:Decimal>
				<xsl:value-of select="."/>
			</gco:Decimal>
		</gmd:eastBoundLongitude>
	</xsl:template>
	<xsl:template match="south_bounding_latitude">
		<gmd:southBoundLatitude>
			<gco:Decimal>
				<xsl:value-of select="."/>
			</gco:Decimal>
		</gmd:southBoundLatitude>
	</xsl:template>
	<xsl:template match="temporal_start_date">
		<gmd:extent>
			<gmd:EX_Extent>
				<gmd:temporalElement>
					<gmd:EX_TemporalExtent>
						<gmd:extent>
							<gml:TimePeriod>
								<xsl:attribute name="gml:id"><xsl:value-of select="concat('id',generate-id())"/></xsl:attribute>
								<gml:name/>
								<gml:beginPosition frame="#ISO-8601">
									<xsl:value-of select="."/>
								</gml:beginPosition>
								<gml:endPosition frame="#ISO-8601">
									<xsl:value-of select="//temporal_end_date"/>
								</gml:endPosition>
							</gml:TimePeriod>
						</gmd:extent>
					</gmd:EX_TemporalExtent>
				</gmd:temporalElement>
			</gmd:EX_Extent>
		</gmd:extent>
	</xsl:template>
	<xsl:template match="extent_flag">
		<gmd:extent>
			<gmd:EX_Extent>
				<gmd:verticalElement>
					<gmd:EX_VerticalExtent>
						<xsl:apply-templates select="//interval_depth_bottom"/>
						<xsl:apply-templates select="//interval_depth_top"/>
						<xsl:apply-templates select="//surface_elevation"/>
					</gmd:EX_VerticalExtent>
				</gmd:verticalElement>
			</gmd:EX_Extent>
		</gmd:extent>
	</xsl:template>
	<xsl:template match="//interval_depth_bottom">
		<xsl:choose>
			<xsl:when test="string-length(string(.))>0">
				<gmd:minimumValue>
					<gco:Real>
						<xsl:value-of select="0"/>
					</gco:Real>
				</gmd:minimumValue>
			</xsl:when>
			<xsl:otherwise>
				<gmd:minimumValue gco:nilReason="missing"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//interval_depth_top">
		<xsl:choose>
			<xsl:when test="string-length(string(.))>0">
				<gmd:maximumValue>
					<gco:Real>
						<xsl:value-of select="0"/>
					</gco:Real>
				</gmd:maximumValue>
			</xsl:when>
			<xsl:otherwise>
				<gmd:maximumValue gco:nilReason="missing"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//surface_elevation">
		<xsl:choose>
			<xsl:when test="string-length(string(.))>0">
				<gmd:verticalCRS xlink:href="">
					<xsl:attribute name="xlink:href"><xsl:value-of select="."></xsl:value-of></xsl:attribute>
				</gmd:verticalCRS>
			</xsl:when>
			<xsl:otherwise>
				<gmd:verticalCRS gco:nilReason="missing"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="resource_flag">
		<gmd:distributionInfo>
			<gmd:MD_Distribution>
				<xsl:apply-templates select="//resource_distributor_flag"/>
				<xsl:apply-templates select="//resource_url"/>
			</gmd:MD_Distribution>
		</gmd:distributionInfo>
	</xsl:template>
	<xsl:template match="//resource_distributor_flag">
		<gmd:distributor>
			<gmd:MD_Distributor>
				<xsl:apply-templates select="//resource_distributor_responsibleparty_flag"/>
				<xsl:apply-templates select="dates"/>
			</gmd:MD_Distributor>
		</gmd:distributor>
	</xsl:template>
	<xsl:template match="//resource_distributor_responsibleparty_flag">
		<gmd:distributorContact>
			<gmd:CI_ResponsibleParty>
				<xsl:apply-templates select="//distributor_contact_person_name"/>
				<xsl:apply-templates select="//distributor_contact_org_name"/>
				<xsl:apply-templates select="//distributor_contact_position_name"/>
				<xsl:apply-templates select="//resource_distributor_responsibleparty_contact_flag"/>
				<gmd:role>
					<gmd:CI_RoleCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_RoleCode" codeListValue="distributor">distributor</gmd:CI_RoleCode>
				</gmd:role>
			</gmd:CI_ResponsibleParty>
		</gmd:distributorContact>
	</xsl:template>
	<xsl:template match="//distributor_contact_person_name">
		<gmd:individualName>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:individualName>
	</xsl:template>
	<xsl:template match="//distributor_contact_org_name">
		<gmd:organisationName>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:organisationName>
	</xsl:template>
	<xsl:template match="//distributor_contact_position_name">
		<gmd:positionName>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:positionName>
	</xsl:template>
	<xsl:template match="//resource_distributor_responsibleparty_contact_flag">
		<gmd:contactInfo>
			<gmd:CI_Contact>
				<xsl:apply-templates select="//resource_distributor_responsibleparty_contact_phone_fax_flag"/>
				<xsl:apply-templates select="//resource_distributor_responsibleparty_contact_address_flag"/>
				<xsl:apply-templates select="//distributor_contact_url"/>
			</gmd:CI_Contact>
		</gmd:contactInfo>
	</xsl:template>
	<xsl:template match="//resource_distributor_responsibleparty_contact_phone_fax_flag">
		<xsl:variable name="voicePhone" select="//distributor_contact_phone"/>
		<xsl:variable name="faxPhone" select="//distributor_contact_fax"/>
		<xsl:choose>
			<xsl:when test="($voicePhone != '') and not(contains($voicePhone,'missing'))">
				<!-- have a voice phone number, use that -->
				<gmd:phone>
					<gmd:CI_Telephone>
						<gmd:voice>
							<gco:CharacterString>
								<xsl:value-of select="$voicePhone"/>
							</gco:CharacterString>
						</gmd:voice>
					</gmd:CI_Telephone>
				</gmd:phone>
			</xsl:when>
			<xsl:when test="($faxPhone != '') and not(contains($faxPhone,'missing'))">
				<!-- have a fax phone number, use that -->
				<gmd:phone>
					<gmd:CI_Telephone>
						<gmd:facsimile>
							<gco:CharacterString>
								<xsl:value-of select="$faxPhone"/>
							</gco:CharacterString>
						</gmd:facsimile>
					</gmd:CI_Telephone>
				</gmd:phone>
			</xsl:when>
		</xsl:choose>
		<!--	<xsl:call-template name="usgin:phoneNumber">
			<xsl:with-param name="voicePhone" select="//distributor_contact_phone"/>
			<xsl:with-param name="faxPhone" select="//distributor_contact_fax"/>
		</xsl:call-template>
		<gmd:phone>
			<gmd:CI_Telephone>
				<xsl:apply-templates select="//distributor_contact_phone"/>
				<xsl:apply-templates select="//distributor_contact_fax"/>
			</gmd:CI_Telephone>
		</gmd:phone> -->
	</xsl:template>
	<xsl:template match="//distributor_contact_phone">
		<gmd:voice>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:voice>
	</xsl:template>
	<xsl:template match="//distributor_contact_fax">
		<gmd:facsimile>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:facsimile>
	</xsl:template>
	<xsl:template match="//resource_distributor_responsibleparty_contact_address_flag">
		<gmd:address>
			<gmd:CI_Address>
				<xsl:apply-templates select="//distributor_contact_street_address"/>
				<xsl:apply-templates select="//distributor_contact_city"/>
				<xsl:apply-templates select="//distributor_contact_state"/>
				<xsl:apply-templates select="//distributor_contact_zip"/>
				<gmd:country>
					<gco:CharacterString>USA</gco:CharacterString>
				</gmd:country>
				<xsl:apply-templates select="//distributor_contact_email"/>
			</gmd:CI_Address>
		</gmd:address>
	</xsl:template>
	<xsl:template match="//distributor_contact_street_address">
		<gmd:deliveryPoint>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:deliveryPoint>
	</xsl:template>
	<xsl:template match="//distributor_contact_city">
		<gmd:city>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:city>
	</xsl:template>
	<xsl:template match="//distributor_contact_state">
		<gmd:administrativeArea>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:administrativeArea>
	</xsl:template>
	<xsl:template match="//distributor_contact_zip">
		<gmd:postalCode>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:postalCode>
	</xsl:template>
	<xsl:template match="//distributor_contact_email">
		<gmd:electronicMailAddress>
			<gco:CharacterString>
				<xsl:value-of select="."/>
			</gco:CharacterString>
		</gmd:electronicMailAddress>
	</xsl:template>
	<xsl:template match="//distributor_contact_url">
		<gmd:onlineResource>
			<gmd:CI_OnlineResource>
				<gmd:linkage>
					<gmd:URL>
						<xsl:value-of select="."/>
					</gmd:URL>
				</gmd:linkage>
			</gmd:CI_OnlineResource>
		</gmd:onlineResource>
	</xsl:template>


	<xsl:template match="dates">
		<gmd:distributionOrderProcess>
			<gmd:MD_StandardOrderProcess>
				<gmd:orderingInstructions>
					<gco:CharacterString>
						<xsl:value-of select="dates"/>
					</gco:CharacterString>
				</gmd:orderingInstructions>
			</gmd:MD_StandardOrderProcess>
		</gmd:distributionOrderProcess>
	</xsl:template>

<!-- templates for TransferOptions/Distributions-->

	<xsl:template match="body_html_url">
	<xsl:for-each select="body_html_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
							</gmd:URL>
						</gmd:linkage>
						<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>federal register body html link</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="pdf_url">
	<xsl:for-each select="pdf_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
							</gmd:URL>
						</gmd:linkage>
						<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>adobe acrobate version of notification</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
		</xsl:for-each>
	</xsl:template>					

	<xsl:template match="raw_text_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
							</gmd:URL>
						</gmd:linkage>
					<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>federal register notification raw text</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
	</xsl:template>		

	<xsl:template match="json_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
							</gmd:URL>
						</gmd:linkage>
						<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>json metadata</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
	</xsl:template>		

	<xsl:template match="public_inspection_pdf_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
	    					</gmd:URL>
						</gmd:linkage>
						<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>federal register public inspection document</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
	</xsl:template>	

	<xsl:template match="html_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
							</gmd:URL>
						</gmd:linkage>
					<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>HTML representation of notification</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
	</xsl:template>	

	<xsl:template match="full_text_xml_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
							</gmd:URL>
						</gmd:linkage>
						<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>XML representation of notification</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
	</xsl:template>

	<xsl:template match="comment_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
							</gmd:URL>
						</gmd:linkage>
						<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>federal register notification comments</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
	</xsl:template>

	<xsl:template match="abstract_html_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
							</gmd:URL>
						</gmd:linkage>
						<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>federal register notification html abstract</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
	</xsl:template>

	<xsl:template match="regulations_dot_gov_url">
		<gmd:transferOptions>
			<gmd:MD_DigitalTransferOptions>
				<gmd:onLine>
					<gmd:CI_OnlineResource>
						<gmd:linkage>
							<gmd:URL>
								<xsl:value-of select="."/>
							</gmd:URL>
						</gmd:linkage>
						<gmd:protocol>
							<gco:CharacterString>http</gco:CharacterString>
						</gmd:protocol>
						<gmd:name>
							<gco:CharacterString>federal register regulation information</gco:CharacterString>
						</gmd:name>
						<gmd:function>
					<gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="download">download</gmd:CI_OnLineFunctionCode>
					</gmd:function>
					</gmd:CI_OnlineResource>
				</gmd:onLine>
			</gmd:MD_DigitalTransferOptions>
		</gmd:transferOptions>
	</xsl:template>

<!-- end of transferOption links/distribution-->

	<xsl:template match="data_quality_flag">
		<gmd:dataQualityInfo>
			<gmd:DQ_DataQuality>
				<gmd:scope>
					<gmd:DQ_Scope>
						<gmd:level>
							<gmd:MD_ScopeCode codeList="http://standards.iso.org/ittf/PubliclyAvailableStandards/ISO_19139_Schemas/resources/Codelist/gmxCodelists.xml#MD_ScopeCode" codeListValue="dataset">dataset</gmd:MD_ScopeCode>
						</gmd:level>
					</gmd:DQ_Scope>
				</gmd:scope>
				<xsl:if test="resource_quality_statement != ''">
					<xsl:apply-templates select="//resource_quality_statement"/>
				</xsl:if>
				<xsl:if test="resource_lineage_statement != ''">
					<xsl:apply-templates select="//resource_lineage_statement"/>
				</xsl:if>
			</gmd:DQ_DataQuality>
		</gmd:dataQualityInfo>
	</xsl:template>
	<xsl:template match="//resource_quality_statement">
		<gmd:report>
			<gmd:DQ_QuantitativeAttributeAccuracy>
				<!-- this element is ignored, its just a container for the result explanation -->
				<gmd:result>
					<gmd:DQ_ConformanceResult>
						<gmd:specification gco:nilReason="inapplicable"/>
						<gmd:explanation>
							<gco:CharacterString>
								<xsl:value-of select="."/>
							</gco:CharacterString>
						</gmd:explanation>
						<gmd:pass gco:nilReason="inapplicable"/>
					</gmd:DQ_ConformanceResult>
				</gmd:result>
			</gmd:DQ_QuantitativeAttributeAccuracy>
		</gmd:report>
	</xsl:template>
	<xsl:template match="//resource_lineage_statement">
		<gmd:lineage>
			<gmd:LI_Lineage>
				<gmd:statement>
					<gco:CharacterString>
						<xsl:value-of select="."/>
					</gco:CharacterString>
				</gmd:statement>
			</gmd:LI_Lineage>
		</gmd:lineage>
	</xsl:template>
	<xsl:template match="resource_constraints_statement">
		<gmd:metadataConstraints>
			<gmd:MD_Constraints>
				<gmd:useLimitation>
					<gco:CharacterString>
						<xsl:value-of select="."/>
					</gco:CharacterString>
				</gmd:useLimitation>
			</gmd:MD_Constraints>
		</gmd:metadataConstraints>
	</xsl:template>

	<xsl:template name="usgin:dateFormat">		
		<xsl:param name="inputDate" select="."/>		
		<!-- input data should be either a gco:Date or a gco:DateTime node -->		
		<!-- USGIN mandates use of DateTime, so will need to add 'T12:00:00Z' to gco:Date string -->		
		<xsl:choose>			
			<xsl:when test="string-length(normalize-space(string($inputDate)))=4">				
				<xsl:value-of select="concat(normalize-space(translate(string($inputDate), '/', '-')),'-01-01T12:00:00Z')"/>		
			</xsl:when>		
			<xsl:when test="string-length(normalize-space(string($inputDate)))=10">				
				<xsl:value-of select="concat(normalize-space(translate(string($inputDate), '/', '-')),'T12:00:00Z')"/>		
			</xsl:when>		
			<xsl:when test="$inputDate/publication_date">			
				<xsl:choose>			
					<xsl:when	test="string-length(normalize-space(string($inputDate/publication_date))) &gt; 17">	
						<xsl:value-of select="$inputDate/publication_date"/>	
					</xsl:when>				
					<xsl:when	test="string-length(normalize-space(string($inputDate/publication_date)))=10">		
						<!-- YYYY-MM-DD -->		
						<xsl:value-of select="concat($inputDate/publication_date,'T12:00:00Z')"/>		
					</xsl:when>		
					<xsl:when	test="string-length(normalize-space(string($inputDate/publication_date)))=11">		
						<!-- YYYY-MM-DDT -->	
						<xsl:value-of	select="concat(normalize-space(string($inputDate/publication_date)),'00:00:00Z')"/>					
					</xsl:when>	
					<xsl:when	test="string-length(normalize-space(string($inputDate/publication_date)))=16">				
						<!-- YYYY-MM-DDTHH:MM -->						
						<xsl:value-of select="concat($inputDate/publication_date,':00Z')"/>	
					</xsl:when>				
					<xsl:otherwise>				
						<xsl:value-of select="string('1900-01-01T12:00:00Z')"/>		
					</xsl:otherwise>	
				</xsl:choose>	
			</xsl:when>		
			<!-- end of gco:dateTime handler -->	
			<xsl:otherwise>	
				<xsl:value-of select="string('1900-01-01T12:00:00Z')"/>	
			</xsl:otherwise>	
		</xsl:choose>	
		<!-- end of inputDate handler -->	
	</xsl:template>


</xsl:stylesheet>
